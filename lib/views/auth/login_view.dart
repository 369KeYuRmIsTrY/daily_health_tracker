// lib/views/auth/login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/app_routes.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Health Tracker')),
      body: Center(
        child: Obx(() {
          if (c.isLoading.value) return const CircularProgressIndicator();
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 120,
              )
                  .animate()
                  .fade(duration: 800.ms)
                  .scale(duration: 800.ms, curve: Curves.easeOutBack),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.login, size: 20),
                label: const Text('Sign in with Google'),
                onPressed: () => c.signInWithGoogle(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 600.ms)
                  .moveY(begin: 20, end: 0, duration: 600.ms, curve: Curves.easeOut),
            ],
          );
        }),
      ),
    );
  }
}
