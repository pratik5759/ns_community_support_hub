import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/core/services/models/user_model.dart';

class MyScreenProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = true;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;


  Future<void> fetchUser() async {
    _user = await AuthService().getStoredUser();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logOut() async{
    await AuthService().signOut();
    notifyListeners();
  }
}
