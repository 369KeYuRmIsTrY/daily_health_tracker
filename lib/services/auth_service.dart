// lib/services/auth_service.dart
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
// Uncomment the import below if you want to use clientId from constants:
import '../utils/constants.dart';

class AuthService {
  // Lazy initialization to prevent crash on startup if clientId is not set
  // Configuration options:
  // 1. For web: Set clientId in web/index.html meta tag (recommended) OR set AppConstants.googleSignInClientId
  // 2. For code: When running on web, clientId will be used. On Android/iOS it will NOT pass clientId.
  GoogleSignIn? _google;
  bool _initializationError = false;

  GoogleSignIn? get _googleSignIn {
    if (_initializationError) return null;
    try {
      _google ??= kIsWeb
          ? GoogleSignIn(
              scopes: ['email'],
              clientId: AppConstants.googleSignInClientId,
            )
          : GoogleSignIn(
              scopes: ['email'],
            );
      return _google;
    } on AssertionError {
      // Specifically catch assertion errors (common on web when clientId is missing)
      _initializationError = true;
      return null;
    } catch (e) {
      // Catch any other errors during initialization
      _initializationError = true;
      return null;
    }
  }

  GoogleSignInAccount? get currentUser {
    try {
      return _googleSignIn?.currentUser;
    } catch (e) {
      return null;
    }
  }

  Future<GoogleSignInAccount?> signIn() async {
    try {
      final google = _googleSignIn;
      if (google == null) {
        throw Exception(
          'Google Sign-In not initialized. Please configure Client ID for web if required.',
        );
      }
      final account = await google.signIn();
      return account;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      final google = _googleSignIn;
      if (google != null) {
        await google.signOut();
      }
    } catch (e) {
      rethrow;
    }
  }
}
