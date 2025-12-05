// lib/controllers/logs_controller.dart
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/activity_model.dart';

class LogsController extends GetxController {
  final ApiService _api = ApiService();
  final RxList<ActivityModel> items = <ActivityModel>[].obs;
  final RxBool loading = false.obs;
  final RxBool initialLoading = false.obs;
  int _page = 0;
  final int _limit = 10;
  bool _hasMore = true;

  bool get hasMore => _hasMore;

  @override
  void onInit() {
    super.onInit();
    loadInitial();
  }

  Future<void> loadInitial() async {
    initialLoading.value = true;
    _page = 0;
    _hasMore = true;
    items.clear();
    await fetchMore();
    initialLoading.value = false;
  }

  Future<void> fetchMore() async {
    if (loading.value || !_hasMore) return;
    loading.value = true;
    try {
      final newItems = await _api.fetchActivities(
        start: _page * _limit,
        limit: _limit,
      );
      if (newItems.isEmpty) {
        _hasMore = false;
      } else {
        items.addAll(newItems);
        _page++;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load activities: $e');
    } finally {
      loading.value = false;
    }
  }

  @override
  Future<void> refresh() async {
    _page = 0;
    _hasMore = true;
    items.clear();
    await fetchMore();
  }
}
