// lib/controllers/timer_controller.dart
import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  static const int initialSeconds = 600; // 10 minutes
  final RxInt secondsLeft = initialSeconds.obs;
  Timer? _timer;
  final RxBool running = false.obs;

  void start() {
    _timer?.cancel();
    running.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 0) {
        t.cancel();
        running.value = false;
        // you can show notification or snackbar here
      } else {
        secondsLeft.value--;
      }
    });
  }

  void pause() {
    _timer?.cancel();
    running.value = false;
  }

  void reset() {
    _timer?.cancel();
    secondsLeft.value = initialSeconds;
    running.value = false;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
