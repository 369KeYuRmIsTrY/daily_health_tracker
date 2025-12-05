// lib/views/dashboard/dashboard_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/fade_in_card.dart';
import '../../widgets/countdown_timer.dart';
import '../../routes/app_routes.dart';
import '../../services/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../widgets/scale_button.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Logs',
            onPressed: () => Get.toNamed(AppRoutes.logs),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () => auth.signOut(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() {
              final user = auth.user.value;
              if (user == null) {
                return const SizedBox.shrink();
              }
              return FadeInCard(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl ?? ''),
                    radius: 28,
                  ),
                  title: Text(user.name ?? ''),
                  subtitle: Text(user.email ?? ''),
                ),
              );
            }),
            const SizedBox(height: 16),
            FadeInCard(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text('Today Steps', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      const Text(
                        '7,512',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CountdownTimerWidget(), // integrated widget
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScaleButton(
                  onPressed: () => Get.toNamed(AppRoutes.graph),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.show_chart),
                    label: const Text('Graph'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade50,
                      foregroundColor: Colors.indigo,
                      disabledBackgroundColor: Colors.indigo.shade50,
                      disabledForegroundColor: Colors.indigo,
                    ),
                    onPressed: null, // handled by ScaleButton
                  ),
                ),
                ScaleButton(
                  onPressed: () => Get.toNamed(AppRoutes.logs),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.history),
                    label: const Text('Logs'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade50,
                      foregroundColor: Colors.deepOrange,
                      disabledBackgroundColor: Colors.orange.shade50,
                      disabledForegroundColor: Colors.deepOrange,
                    ),
                    onPressed: null, // handled by ScaleButton
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ScaleButton(
                  onPressed: () async {
                    await NotificationService().showNotification(
                      id: 0,
                      title: 'Test Notification',
                      body: 'This is an instant notification!',
                    );
                  },
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.notifications),
                    label: const Text('Notify Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade50,
                      foregroundColor: Colors.green,
                      disabledBackgroundColor: Colors.green.shade50,
                      disabledForegroundColor: Colors.green,
                    ),
                    onPressed: null,
                  ),
                ),
                ScaleButton(
                  onPressed: () async {
                    await NotificationService().scheduleNotification(
                      id: 1,
                      title: 'Scheduled Notification',
                      body: 'This notification was scheduled 5 seconds ago.',
                      scheduledTime: DateTime.now().add(const Duration(seconds: 5)),
                    );
                    Get.snackbar('Scheduled', 'Notification scheduled for 5 seconds later');
                  },
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.schedule),
                    label: const Text('Schedule (5s)'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade50,
                      foregroundColor: Colors.purple,
                      disabledBackgroundColor: Colors.purple.shade50,
                      disabledForegroundColor: Colors.purple,
                    ),
                    onPressed: null,
                  ),
                ),
                ScaleButton(
                  onPressed: () async {
                    await NotificationService().showPeriodicNotification(
                      id: 2,
                      title: 'Drink Water',
                      body: 'Time to hydrate! ',
                      interval: RepeatInterval.everyMinute,
                    );
                    Get.snackbar('Started', 'Periodic notification started (every minute)');
                  },
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.repeat),
                    label: const Text('Every Minute'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade50,
                      foregroundColor: Colors.teal,
                      disabledBackgroundColor: Colors.teal.shade50,
                      disabledForegroundColor: Colors.teal,
                    ),
                    onPressed: null,
                  ),
                ),
                ScaleButton(
                  onPressed: () async {
                    await NotificationService().cancelAll();
                    Get.snackbar('Cancelled', 'All notifications cancelled');
                  },
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel All'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                      foregroundColor: Colors.red,
                      disabledBackgroundColor: Colors.red.shade50,
                      disabledForegroundColor: Colors.red,
                    ),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
