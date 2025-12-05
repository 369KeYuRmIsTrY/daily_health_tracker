// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeService.init(); // load saved theme
  await NotificationService().init(); // Initialize notifications
  runApp(const DailyHealthApp());
}

class DailyHealthApp extends StatelessWidget {
  const DailyHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Health Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeService.lightTheme,
      darkTheme: ThemeService.darkTheme,
      themeMode: ThemeService.themeMode,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const NotFoundPage(),
      ),
    );
  }
}

/// ThemeService: simple utility to persist theme mode using SharedPreferences.
/// Import this class into other files to toggle theme: ThemeService.toggleTheme();
class ThemeService {
  static const _key = 'isDarkMode';
  static late SharedPreferences _prefs;
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    useMaterial3: true,
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    useMaterial3: true,
  );

  static ThemeMode get themeMode {
    final isDark = _prefs.getBool(_key) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Call during app startup
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Toggle between light/dark and notify GetX to update theme immediately
  static Future<void> toggleTheme() async {
    final isDark = _prefs.getBool(_key) ?? false;
    await _prefs.setBool(_key, !isDark);
    Get.changeThemeMode(!isDark ? ThemeMode.dark : ThemeMode.light);
  }

  /// Optional: set explicitly
  static Future<void> setDarkMode(bool enabled) async {
    await _prefs.setBool(_key, enabled);
    Get.changeThemeMode(enabled ? ThemeMode.dark : ThemeMode.light);
  }
}

/// A small 'not found' page
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page not found')),
      body: const Center(child: Text('404 — Page not found')),
    );
  }
}
