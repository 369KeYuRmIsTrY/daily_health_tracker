// lib/routes/app_pages.dart
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../views/auth/login_view.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/graph/graph_view.dart';
import '../views/logs/logs_view.dart';
import '../views/splash/splash_view.dart';
import '../binding/auth_binding.dart';
import '../binding/dashboard_binding.dart';
import '../binding/graph_binding.dart';
import '../binding/logs_binding.dart';
import '../binding/timer_binding.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      bindings: [DashboardBinding(), TimerBinding()],
    ),
    GetPage(
      name: AppRoutes.graph,
      page: () => const GraphView(),
      binding: GraphBinding(),
    ),
    GetPage(
      name: AppRoutes.logs,
      page: () => const LogsView(),
      binding: LogsBinding(),
    ),
  ];
}
