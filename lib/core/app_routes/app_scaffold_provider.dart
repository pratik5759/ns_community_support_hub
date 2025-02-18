// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/services/auth_service.dart';
// import 'package:ns_community_support_hub/core/services/models/user_model.dart';
//
// class AppScaffoldProvider extends ChangeNotifier {
//   bool _isLoggedIn = false;
//   UserModel? _user; // Store user details
//
//   bool get isLoggedIn => _isLoggedIn;
//   UserModel? get user => _user; // Expose user data
//
//   AppScaffoldProvider() {
//     _checkLoginStatus();
//   }
//
//   /// Check login status and update user details if logged in
//   Future<void> _checkLoginStatus() async {
//     _isLoggedIn = await AuthService().isUserLoggedIn();
//     if (_isLoggedIn) {
//       await _fetchUserData(); // Fetch user details if logged in
//     } else {
//       _user = null;
//     }
//     notifyListeners();
//   }
//
//   /// Fetch user details from AuthService
//   Future<void> _fetchUserData() async {
//     final userData = await AuthService().getStoredUser(); // Implement in AuthService
//     if (userData != null) {
//       _user = userData;
//     }
//     notifyListeners();
//   }
//
//   // /// Handle user login
//   // Future<void> login() async {
//   //   final userData = await AuthService().signInWithGooglePopup(); // Assume this returns user details
//   //   if (userData != null) {
//   //     _isLoggedIn = true;
//   //     _user = UserModel.fromMap(userData);
//   //     notifyListeners();
//   //   }
//   // }
//   //
//   // /// Handle user logout
//   // Future<void> logout() async {
//   //   await AuthService().logout();
//   //   _isLoggedIn = false;
//   //   _user = null; // Clear user data
//   //   notifyListeners();
//   // }
// }
//
