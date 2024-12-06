import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReadData(),
    );
  }
}

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  //flutter blue plus instance

  //BLE scale mac Address prefix 3digits fixed hex from manufacturer
  final String _weightScaleId = '3D:0A:55';
  List hexList = [];

  double _weighFromScale = 0.0;

  @override
  void initState() {
    _startScanning();
    _listenScanResult();
    super.initState();
  }

  //start scanning
  void _startScanning() {
    FlutterBluePlus.startScan();
  }

  //listen scanning
  void _listenScanResult() {
    FlutterBluePlus.scanResults.listen((scanList) {
      int index = 1;
      for (ScanResult result in scanList) {
        log("Device ${index++}-> ${result.device.remoteId.str}");

        //if platform is android
        if (Platform.isAndroid) {
          //check for the ble weight scale on Android using scale id
          if (result.device.remoteId.str.contains(_weightScaleId)) {
            _readWeightData(result);
          }
        }

        //if Platform is IOS
        if (Platform.isIOS) {
          //check for the ble weight scale on IOS
          bool issBLEScaleFound = _checkBLEWeightScaleIOS(result);

          //if BLE scale found
          if (issBLEScaleFound) {
            _readWeightData(result);
          }
        }
      }
    });
  }

  bool _checkBLEWeightScaleIOS(ScanResult result) {
    //get Hex List from advertisementData.manufacturerData Map
    // Ex. [02, B1, 3E, 23, 8A, 7C, 09, EB, 2D, 1C, 02, 23, 1D, 2E, 5D, 82, DA, 8B, 15, 41, 67, 51, 18, 25]
    List dataList = _getManufacturerDataList(
      result.advertisementData.manufacturerData,
    );

    //if list is not empty
    if (dataList.isNotEmpty) {
      //Split list by comma to get only list of digit
      List hexList = dataList.first.toString().split(',');

      //check for the BLE scale mac Address first 3 fixed hex 3E:23:8A values from  List
      if (hexList.length >= 5) {
        //if the first 3 digit matches with the mac address hex digit then bluetooth device is found
        if (hexList[2] == '3E' && hexList[3] == '23' && hexList[4] == '8A') {
          return true;
        }
      }
    }
    return false;
  }

  //format Manufacturer data to list
  List<String> _getManufacturerDataList(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return [];
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(_getHexString(bytes));
    });
    return res;
  }

  //get Hex String from bytes
  String _getHexString(List<int> bytes) {
    return bytes
        .map((i) => i.toRadixString(16).padLeft(2, '0'))
        .join(',')
        .toUpperCase();
  }

  void _readWeightData(ScanResult result) {
    List dataList =
        _getManufacturerDataList(result.advertisementData.manufacturerData);
    if (dataList.isNotEmpty) {
      //get Hex String from dataList
      // [02, B1, 3E, 23, 8A, 7C, 09, EB, 2D, 1C, 02, 23, 1D, 2E, 5D, 82, DA, 8B, 15, 41, 67, 51, 18, 25]
      // and convert to list
      hexList = dataList.first.toString().split(',');
      log("Hex List [${hexList.length}] -> $hexList");

      //here we are swapping the hex value example. 8B15 to 158B
      // 8B=>17th index and 15=>18th index in hexList
      String hexString = hexList[0] + hexList[1];
      log("Hex String -> $hexString");

      //int value after parsing hexString to int
      // example. 158B = > 5515 (shows 55.15 kg in bluetooth scale device and unit is kg)
      //NOTE - bluetooth device sends weight data in kg unit
      int weightInInt = int.parse(hexString, radix: 16);

      //divide the (weightInInt / 100 ) => example. (5515 /100 = 55.15)
      //to get  final weight we get in bluetooth scale to display in the app
      _weighFromScale = weightInInt / 100;

      //refresh UI
      setState(() {});
    }
  }

  // Function to calculate BMI
  double calculateBMI(double weightKg, double heightCm) {
    double heightM = heightCm / 100;
    double bmi = weightKg / math.pow(heightM, 2);
    if (weightKg <= 0) return 0;
    return bmi;
  }

  String calculateObesityDegree(double bmi) {
    // Example: Categorizing obesity based on BMI (simplified example)
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 24.9) {
      return "Normal weight";
    } else if (bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmiResult = calculateBMI(_weighFromScale, 170);
    String obesityDegree = calculateObesityDegree(bmiResult);

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weight Data',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              "Weight: ${_weighFromScale}Kg",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "BMI: $bmiResult",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Obesity: $obesityDegree",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _weighFromScale = 0.0;
                bmiResult = 0.0;
                obesityDegree = "";
                setState(() {});
                _startScanning();
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
