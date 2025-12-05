// lib/controllers/graph_controller.dart
import 'package:get/get.dart';

class GraphController extends GetxController {
  // Example: steps for last 7 days (Mon-Sun)
  final RxList<int> steps = <int>[5000, 7200, 6500, 8100, 9200, 7600, 10000].obs;

  // Replace with API fetching or local json reading if desired.
  void updateSteps(List<int> newSteps) {
    steps.value = newSteps;
  }
}
