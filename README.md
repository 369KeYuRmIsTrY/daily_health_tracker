# 🏃‍♂️ Daily Health Tracker

A modern, feature-rich Flutter application designed to track daily health activities, visualize progress, and keep you motivated with smart notifications. Built with **Flutter** and **GetX**.

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/State_Management-GetX-purple?style=for-the-badge)

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