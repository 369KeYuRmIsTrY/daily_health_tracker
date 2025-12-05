// lib/utils/constants.dart
class AppConstants {
  // App Name
  static const String appName = "Daily Health Tracker";

  // Google Sign-In Configuration
  // TODO: Replace with your actual Google OAuth 2.0 Client ID
  // Get it from: https://console.cloud.google.com/apis/credentials
  // For Android: Use the Android client ID
  // For iOS: Use the iOS client ID
  // For Web: Add to web/index.html meta tag
  static const String? googleSignInClientId =
      "339729639568-fag3cisbetvhghpklpuvhqmukgsr84mc.apps.googleusercontent.com";

  // API URLs
  static const String apiBase = "https://jsonplaceholder.typicode.com";
  static const String activityEndpoint = "/posts";

  // Common Strings
  static const String stepsTitle = "Today Steps";
  static const String nextWalkReminder = "Next Walk Reminder";

  // Timer
  static const int defaultTimerSeconds = 600; // 10 minutes

  // Graph labels
  static const List<String> weekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  // Padding
  static const double defaultPadding = 16.0;

  // Animations
  static const int animationDuration = 400; // milliseconds
}
