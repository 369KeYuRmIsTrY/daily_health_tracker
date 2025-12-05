// lib/widgets/countdown_timer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/timer_controller.dart';

class CountdownTimerWidget extends StatelessWidget {
  const CountdownTimerWidget({Key? key}) : super(key: key);

  String _fmt(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final TimerController ctrl = Get.find();
    return Column(
      children: [
        Obx(
          () => Text(
            _fmt(ctrl.secondsLeft.value),
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: ctrl.running.value ? ctrl.pause : ctrl.start,
                child: Text(ctrl.running.value ? 'Pause' : 'Start'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: ctrl.reset, child: const Text('Reset')),
            ],
          ),
        ),
      ],
    );
  }
}
