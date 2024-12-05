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

# Body Composition Breakdown

## Personal Information

- **Age**: 23 years
- **BMI**: 19.7
- **Height**: 170 cm (1.70 m)
- **Weight**: 57 kg
- **Gender**: Male

---

## 1. **Body Fat Percentage**

Using the BMI-based estimation formula for men:

\[
\text{Body Fat Percentage} = (1.20 \times \text{BMI}) + (0.23 \times \text{Age}) - 16.2
\]

Substituting the values:

\[
\text{Body Fat Percentage} = (1.20 \times 19.7) + (0.23 \times 23) - 16.2
\]
\[
\text{Body Fat Percentage} = 23.64 + 5.29 - 16.2 = 12.73\%
\]

- **Body Fat Percentage**: **12.73%**
- **Body Fat Mass**:

\[
\text{Body Fat Mass} = \frac{\text{Body Fat Percentage}}{100} \times \text{Weight}
\]
\[
\text{Body Fat Mass} = \frac{12.73}{100} \times 57 = 7.25 \text{ kg}
\]

---

## 2. **Skeletal Muscle Percentage**

Estimated at 42% of total body weight:

- **Skeletal Muscle Mass**:

\[
\text{Skeletal Muscle Mass} = \frac{42}{100} \times \text{Weight}
\]
\[
\text{Skeletal Muscle Mass} = \frac{42}{100} \times 57 = 23.94 \text{ kg}
\]

- **Skeletal Muscle Percentage**: **42%**

---

## 3. **Total Muscle Percentage**

Estimated at 45% of total body weight:

- **Total Muscle Mass**:

\[
\text{Total Muscle Mass} = \frac{45}{100} \times \text{Weight}
\]
\[
\text{Total Muscle Mass} = \frac{45}{100} \times 57 = 25.65 \text{ kg}
\]

- **Total Muscle Percentage**: **45%**

---

## 4. **Water Percentage**

Estimated at 60% of total body weight:

- **Water Mass**:

\[
\text{Water Mass} = \frac{60}{100} \times \text{Weight}
\]
\[
\text{Water Mass} = \frac{60}{100} \times 57 = 34.2 \text{ kg}
\]

- **Water Percentage**: **60%**

---

## 5. **Bone Mass**

Estimated at 4% of total body weight:

- **Bone Mass**:

\[
\text{Bone Mass} = \frac{4}{100} \times \text{Weight}
\]
\[
\text{Bone Mass} = \frac{4}{100} \times 57 = 2.28 \text{ kg}
\]

- **Bone Mass**: **2.28 kg**

---

### **Important Notes:**

- These calculations are based on BMI and general population averages, and may not be entirely accurate for everyone.
- More precise body composition analysis requires methods like **DEXA**, **bioimpedance**, or **hydrostatic weighing**.
- **Muscle mass** and **water percentage** are estimates that can vary depending on fitness level and hydration.
