import 'package:flutter/material.dart';
import 'package:whatsapp__clone/models/user.dart';
import 'package:whatsapp__clone/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  User _user;
  AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}