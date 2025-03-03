import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ns_community_support_hub/core/services/models/user_model.dart';


class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// 🔹 Save user data securely
  Future<void> saveUser(UserModel user) async {
    await _storage.write(key: "uid", value: user.uid);
    await _storage.write(key: "name", value: user.name);
    await _storage.write(key: "email", value: user.email);
    await _storage.write(key: "photoUrl", value: user.photoUrl);
    await _storage.write(key: "authToken", value: user.authToken);
  }

  /// 🔹 Retrieve stored user data
  Future<UserModel?> getUser() async {
    Map<String, String?> userData = {
      "uid": await _storage.read(key: "uid"),
      "name": await _storage.read(key: "name"),
      "email": await _storage.read(key: "email"),
      "photoUrl": await _storage.read(key: "photoUrl"),
      "authToken": await _storage.read(key: "authToken"),
    };

    if (userData["authToken"] == null) {
      return null; // No user found
    }

    return UserModel.fromMap(userData);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: "name");
  }



  Future<String?> getUserId() async {
    return await _storage.read(key: "uid");
  }
  Future<String?> getUserProfilePic() async {
    return await _storage.read(key: "photoUrl");
  }


  /// 🔹 Check if user is logged in (based on auth token)
  Future<bool> isUserLoggedIn() async {
    String? token = await _storage.read(key: "authToken");
    return token != null;
  }

  /// 🔹 Delete stored user data (Logout)
  Future<void> deleteUser() async {
    await _storage.deleteAll();
  }
}
