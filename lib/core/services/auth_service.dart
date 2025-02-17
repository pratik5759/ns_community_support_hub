// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ns_community_support_hub/core/services/models/user_model.dart';
// import 'secure_storage_service.dart';
//
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final SecureStorageService _storageService = SecureStorageService();
//
//   /// 🔹 Sign in with Google (Popup)
//   Future<UserModel?> signInWithGooglePopup() async {
//     try {
//       GoogleAuthProvider googleProvider = GoogleAuthProvider();
//
//       // Sign in with Popup (Web Only)
//       UserCredential userCredential = await _auth.signInWithPopup(googleProvider);
//       User? user = userCredential.user;
//
//       if (user != null) {
//         // Get ID Token
//         String? idToken = await user.getIdToken();
//
//         // Create UserModel instance
//         UserModel userModel = UserModel(
//           uid: user.uid,
//           name: user.displayName ?? "Unknown",
//           email: user.email ?? "No Email",
//           photoUrl: user.photoURL ?? "",
//           authToken: idToken ?? "",
//         );
//
//         // Save user details securely
//         await _storageService.saveUser(userModel);
//
//         return userModel;
//       }
//     } catch (error) {
//       print("Google Sign-In Error: $error");
//     }
//     return null;
//   }
//
//   /// 🔹 Check if user is logged in
//   Future<bool> isUserLoggedIn() async {
//     return await _storageService.isUserLoggedIn();
//   }
//
//   /// 🔹 Get stored user details
//   Future<UserModel?> getStoredUser() async {
//     return await _storageService.getUser();
//   }
//
//   /// 🔹 Sign out
//   Future<void> signOut() async {
//     //await GoogleSignIn().signOut();
//     await _auth.signOut();
//     await _storageService.deleteUser();
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/services/models/user_model.dart';
import 'secure_storage_service.dart';

class AuthService {
  // 🔹 Singleton Instance
  AuthService._privateConstructor();
  static final AuthService _instance = AuthService._privateConstructor();
  factory AuthService() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SecureStorageService _storageService = SecureStorageService();

  /// 🔹 Sign in with Google (Popup)
  Future<UserModel?> signInWithGooglePopup() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Sign in with Popup (Web Only)
      UserCredential userCredential = await _auth.signInWithPopup(googleProvider);
      User? user = userCredential.user;

      if (user != null) {
        // Get ID Token
        String? idToken = await user.getIdToken();

        // Create UserModel instance
        UserModel userModel = UserModel(
          uid: user.uid,
          name: user.displayName ?? "Unknown",
          email: user.email ?? "No Email",
          photoUrl: user.photoURL ?? "",
          authToken: idToken ?? "",
        );

        // Save user details securely
        await _storageService.saveUser(userModel);

        return userModel;
      } else {
        debugPrint("Google Sign-In Error: User is null");
        return null;
      }
    } catch (error) {
      debugPrint("Google Sign-In Error: $error");
      return null; // Optionally, return an error message instead
    }
  }

  /// 🔹 Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    try {
      return await _storageService.isUserLoggedIn();
    } catch (e) {
      debugPrint("Error checking user login status: $e");
      return false;
    }
  }

  /// 🔹 Get stored user details
  Future<UserModel?> getStoredUser() async {
    try {
      return await _storageService.getUser();
    } catch (e) {
      debugPrint("Error getting stored user: $e");
      return null;
    }
  }

  /// 🔹 Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _storageService.deleteUser();
      debugPrint("User signed out successfully");
    } catch (e) {
      debugPrint("Sign-out error: $e");
    }
  }
}
