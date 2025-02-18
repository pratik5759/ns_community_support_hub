import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/core/services/models/user_model.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  /// 🔹 Initialize and check if user is already logged in
  Future<void> loadUser() async {
    _isLoading = true;
    notifyListeners();

    _currentUser = await _authService.getStoredUser();

    _isLoading = false;
    notifyListeners();
  }

  /// 🔹 Sign in with Google and update UI
  Future<void> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    UserModel? user = await _authService.signInWithGooglePopup();

    if (user != null) {
      _currentUser = user;
    }

    _isLoading = false;
    notifyListeners();
  }

  /// 🔹 Sign out and update UI
  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
