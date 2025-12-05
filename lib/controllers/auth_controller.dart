// lib/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _service = AuthService();
  final Rxn<UserModel> user = Rxn<UserModel>();
  final RxBool isLoading = false.obs;

  // Removed onInit() to prevent GoogleSignIn initialization error on startup
  // User will need to sign in fresh each time
  // This prevents app crash when Client ID is not configured

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? acct = await _service.signIn();
      if (acct != null) {
        user.value = UserModel(
          id: acct.id,
          name: acct.displayName,
          email: acct.email,
          photoUrl: acct.photoUrl,
        );
        Get.offNamed(AppRoutes.dashboard);
      }
    } catch (e) {
      print("GOOGLE SIGN IN ERROR: $e");
      
      // Fallback to Mock User for testing without Firebase/Cloud Console
      Get.snackbar('Mock Login', 'Google Sign-In failed. Logging in as Guest.');
      user.value = UserModel(
        id: 'guest_123',
        name: 'Guest User',
        email: 'guest@example.com',
        photoUrl: 'https://via.placeholder.com/150',
      );
      Get.offNamed(AppRoutes.dashboard);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _service.signOut();
    user.value = null;
    Get.offAllNamed(AppRoutes.login);
  }
}
