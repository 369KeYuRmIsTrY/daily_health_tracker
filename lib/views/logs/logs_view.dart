// lib/views/logs/logs_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/logs_controller.dart';

class LogsView extends StatelessWidget {
  const LogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LogsController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Activity Logs')),
      body: Obx(() {
        if (c.initialLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: c.refresh,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (!c.loading.value &&
                  c.hasMore &&
                  scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 200) {
                c.fetchMore();
              }
              return false;
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: c.items.length + (c.hasMore ? 1 : 0),
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                if (index >= c.items.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final item = c.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.body),
                  leading: CircleAvatar(child: Text(item.id.toString())),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
