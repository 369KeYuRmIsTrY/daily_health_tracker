# 🏃‍♂️ Daily Health Tracker

A modern, feature-rich Flutter application designed to track daily health activities, visualize progress, and keep you motivated with smart notifications. Built with **Flutter** and **GetX**.

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/State_Management-GetX-purple?style=for-the-badge)

<!-- Screenshot gallery (3 columns x 2 rows) -->
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/1d982d86-bbcf-471e-9abb-0e7f7034c1b4" alt="Splash screen" width="300"/><br/>
      <strong>Splash screen</strong>
    </td>
      <td>
         <img src="https://github.com/user-attachments/assets/6017356d-05d3-4507-ba8e-4402d7b4a2fc" alt="Login screen" width="300"/><br/>
         <strong>Selecting Account</strong>
      </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/72a841ca-fa1f-43c9-86a5-7e99b26a94be" alt="Login screen" width="300"/><br/>
      <strong>Login screen</strong>
    </td>
  </tr>
  <tr>
      <td align="center">
      <img src="https://github.com/user-attachments/assets/013cfdca-a8dc-4a1f-8f2a-80dc6ef4d879" alt="Dashboard" width="300"/><br/>
      <strong>Dashboard</strong>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/54a9cee3-48d9-4c90-aa22-5d1ee6117dc8" alt="Graph screen" width="300"/><br/>
      <strong>Graph screen</strong>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/795a9ea8-756c-43cf-85b5-245ecedb6287" alt="Notification testing" width="300"/><br/>
      <strong>Notification testing</strong>
    </td>
    <td></td>
  </tr>
</table>


## ✨ Features

### 🔐 Authentication
*   **Google Sign-In**: Secure login using your Google account.
*   **Guest Mode**: Seamless fallback to a guest profile if Google Sign-In is not configured or fails.
*   **Profile Integration**: Displays user name, email, and profile picture on the dashboard.

### 📊 Dashboard & Visualization
*   **Interactive Graph**: Beautiful 7-day step count visualization using `fl_chart` with gradient bars.
*   **Animated UI**: Smooth fade-in and scale animations for cards and buttons using `flutter_animate`.
*   **Countdown Timer**: Integrated 10-minute timer for tracking specific activities.

### 📝 Activity Logs
*   **REST API Integration**: Fetches activity data from a remote API (JSONPlaceholder).
*   **Infinite Scrolling**: Efficient lazy loading of logs for optimal performance.
*   **Pull-to-Refresh**: Easy data reloading with a simple swipe gesture.

*   **Navigation**: GetX Named Routes
*   **Networking**: http
*   **Local Storage**: shared_preferences
*   **Charts**: fl_chart
*   **Animations**: flutter_animate
*   **Notifications**: flutter_local_notifications

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK installed
*   Android Studio / VS Code
*   An Android Emulator or Physical Device

### Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/369KeYuRmIsTrY/daily_health_tracker.git
    cd daily_health_tracker
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the app**
    ```bash
    flutter run
    ```

### 🔑 Google Sign-In Setup (Optional)
To enable real Google Sign-In on Android:
1.  Create a project in the [Firebase Console](https://console.firebase.google.com/).
2.  Add an Android app and download `google-services.json`.
3.  Place `google-services.json` in `android/app/`.
4.  Uncomment the `google-services` plugin in `android/build.gradle` and `android/app/build.gradle`.

*Note: The app works in Guest Mode without this setup.*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
Made by [Keyur Mistry](https://github.com/369KeYuRmIsTrY)
