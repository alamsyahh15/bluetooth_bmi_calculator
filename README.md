# BMI Bluetooth Scale

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Reference Calculation

Let's break down your body composition calculations based on the data provided:

# Given Data:

- **Age**: 23 years
- **BMI**: 19.7
- **Height**: 170 cm (1.70 m)
- **Weight**: 57 kg
- **Gender**: Male

### **1. Calculate Body Fat Percentage and in kg**

We will use the **BMI-based body fat percentage formula for men** to estimate your body fat percentage:

\[
\text{Body Fat Percentage} = (1.20 \times \text{BMI}) + (0.23 \times \text{Age}) - 16.2
\]

Substituting the given values:

\[
\text{Body Fat Percentage} = (1.20 \times 19.7) + (0.23 \times 23) - 16.2
\]
\[
\text{Body Fat Percentage} = 23.64 + 5.29 - 16.2 = 12.73\%
\]

So, your **body fat percentage** is approximately **12.73%**.

#### Now, to calculate **Body Fat in kg**:

\[
\text{Body Fat in kg} = \frac{\text{Body Fat Percentage}}{100} \times \text{Total Body Weight}
\]
\[
\text{Body Fat in kg} = \frac{12.73}{100} \times 57 = 7.25 \text{ kg}
\]

So, **body fat mass** is approximately **7.25 kg**.

---

### **2. Calculate Skeletal Muscle Percentage and in kg**

Skeletal muscle mass (SMM) is the mass of the muscles attached to your bones. For a male with a BMI of 19.7 (which is considered lean), skeletal muscle mass generally ranges between **40-45%** of total body weight.

Let's use **42%** as an estimate for your skeletal muscle mass:

\[
\text{Skeletal Muscle Percentage} = 42\%
\]
\[
\text{Skeletal Muscle Mass} = \frac{42}{100} \times 57 = 23.94 \text{ kg}
\]

So, your **skeletal muscle mass** is approximately **23.94 kg**, and **skeletal muscle percentage** is **42%** of your total body weight.

---

### **3. Calculate Total Muscle Percentage and in kg**

Total muscle mass refers to both **skeletal muscle** and the muscle within organs (cardiac, smooth muscle, etc.). Generally, **45-50%** of a man's body weight consists of total muscle mass.

Since you have a low BMI and are relatively lean, we'll estimate **45%** for total muscle mass:

\[
\text{Total Muscle Percentage} = 45\%
\]
\[
\text{Total Muscle Mass} = \frac{45}{100} \times 57 = 25.65 \text{ kg}
\]

So, your **total muscle mass** is approximately **25.65 kg**, and **total muscle percentage** is **45%** of your total body weight.

---

### **4. Calculate Water Percentage and in kg**

Total body water (TBW) typically makes up about **50-65%** of a person's total body weight, with men generally having higher water percentages than women due to greater muscle mass. A common estimate for a fit male is **60%** of body weight.

\[
\text{Water Percentage} = 60\%
\]
\[
\text{Water Mass} = \frac{60}{100} \times 57 = 34.2 \text{ kg}
\]

So, your **total body water mass** is approximately **34.2 kg**, and **water percentage** is **60%**.

---

### **5. Calculate Bone Mass in kg**

Bone mass is typically around **3-5%** of body weight. For a male with your height and weight, **4%** is a reasonable estimate.

\[
\text{Bone Mass Percentage} = 4\%
\]
\[
\text{Bone Mass} = \frac{4}{100} \times 57 = 2.28 \text{ kg}
\]

So, your **bone mass** is approximately **2.28 kg**.

---

### **Summary of Calculations:**

1. **Body Fat Percentage**: **12.73%**
   - **Body Fat in kg**: **7.25 kg**
2. **Skeletal Muscle Percentage**: **42%**
   - **Skeletal Muscle Mass in kg**: **23.94 kg**
3. **Total Muscle Percentage**: **45%**

   - **Total Muscle Mass in kg**: **25.65 kg**

4. **Water Percentage**: **60%**

   - **Water Mass in kg**: **34.2 kg**

5. **Bone Mass**: **2.28 kg**

---

### **Notes:**

- These are estimates based on your BMI and general population averages.
- To get a more accurate picture of your body composition, you would need to use specialized methods like **DEXA**, **bioimpedance**, or **hydrostatic weighing**.
- The **muscle mass percentages** (skeletal and total muscle) and **water percentage** are approximations that depend on fitness level, hydration status, and other factors.

Let me know if you need further clarification or if you want to explore more about body composition methods!
