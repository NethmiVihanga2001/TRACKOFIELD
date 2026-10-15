# TrackoField Mobile App (Flutter)

A cross-platform Flutter mobile application replicating the TrackoField field employee tracking and management interfaces.

## 📱 Replicated Interfaces & Features

1. **Hero Section & Partner Leaders**
   - Deep Cobalt Blue Hero section (`#16399A`)
   - Dashboard & Smartphone side-by-side mockup displaying live GPS tracking, routes, and geofences
   - Partner leader badges: *Swara Fincorp*, *Sugam GROUP*, and *SOUDAL*

2. **Geo-Verified Task Allocation**
   - Proximity-based task distribution details and verification checkmarks
   - Map overview with Syracuse streets, circular geofence, and tracked route
   - Selena Green floating card with interactive **CALL** and **LOCATION** action pills
   - Interactive vertical timeline card (`22-02-2024`, Attendance Mark IN, active Task Completed step, Attendance Mark Out)

3. **Attendance and Leave Tracking**
   - Geo-coded attendance mark in/out with polygon geofence on map
   - Rida live status pin: *"Rida Logged In (09:30 AM)"*
   - Floating **Leave Request** card with interactive **Approve** and **Reject** buttons, 3-day duration breakdown, remaining leaves meter, and vacation reason

4. **Payroll and Salary Computation**
   - Monthly payroll summary: `$365,892` with user avatar stack and `Oct Total Payroll: $160,756`
   - Smooth curved monthly expense line chart (`Jun`–`Dec`) with gradient fill
   - Joseph's December payout card (`$1500 • PAID`)
   - Employee salary list: Bassie Cooper (`$3650 ✔`), Floyed Miles (`$6598 ✖`), Ralph Edward (`$1245 ✔`)

5. **Employee Expense Management**
   - In-app claim processing and reimbursement tracking
   - Patrick's Travel Expense (`$10.80`) with interactive **[✕]** and **[✓]** buttons
   - Steward's Stationery Expense (`$3 • Approved`)
   - John's Food Expense (`$7 • Rejected`)
   - Interactive **"view bill"** link opening a digital invoice receipt modal

6. **Voice Note Sharing**
   - Field operations voice communication feature breakdown
   - 3 Q&A value props (*"Voice to Text"*, *"Voice Note"*, *"Voice Recording"*)
   - Interactive Voice Note audio player with play/pause and animated waveform
   - *"Navigate Smartly and Operate Smoothly In The Field"* CTA section

7. **Sticky "Book a Demo" Bar & Navigation Modes**
   - Persistent bottom bar opening a complete demo scheduling modal sheet
   - Quick section tab switcher (jump directly to any section)
   - Single-screen tab view vs. continuous flow toggle
   - **"Compare Original"** sheet to compare each interface with the original reference images

---

## 🚀 Running the App

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and added to PATH.

### Run on Android
```bash
flutter run -d android
```

### Build Android APK
```bash
flutter build apk --release
```

### Run on Web
```bash
flutter run -d chrome
```

### Run on Windows Desktop
```bash
flutter run -d windows
```
