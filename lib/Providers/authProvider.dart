import 'package:flutter/material.dart';

enum Status{
  NotRegistered,
  NotLoggedIn,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthProvider extends ChangeNotifier {
  Status _loggedinStatus = Status.NotLoggedIn;
  Status _registeredStatus = Status.NotRegistered;
}