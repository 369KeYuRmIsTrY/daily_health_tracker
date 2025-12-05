// lib/controllers/dashboard_controller.dart
import 'package:get/get.dart';
import '../models/user_model.dart';

class DashboardController extends GetxController {
  final Rxn<UserModel> user = Rxn<UserModel>();

  void setUser(UserModel u) => user.value = u;
}
