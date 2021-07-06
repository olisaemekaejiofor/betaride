import 'package:flutter/material.dart';
import 'package:mybetaride/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User();

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
