import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mybetaride/helpers/app_url.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/models/user.dart';

enum Status {
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

  // ignore: unnecessary_getters_setters
  Status get loggedinStatus => _loggedinStatus;

  // ignore: unnecessary_getters_setters
  set loggedinStatus(Status value) {
    _loggedinStatus = value;
  }

  // ignore: unnecessary_getters_setters
  Status get registeredStatus => _registeredStatus;

  // ignore: unnecessary_getters_setters
  set registeredStatus(Status value) => _registeredStatus = value;

  Future<Map<String, String>> register(
    String firstname,
    String lastname,
    String email,
    String password,
    String state,
    String phone,
  ) async {
    final Map<String, String> apiBodyData = {
      "firstName": firstname,
      "lastName": lastname,
      "password": password,
      "email": email,
      "address": state,
      "phone": "0" + phone,
      "stateOfResidence": state,
      "role": "driver",
    };

    return await post(
      Uri.parse(AppUrl.register),
      body: json.encode(apiBodyData),
      headers: {'Content-Type': 'application/json'},
    ).then(onValue).catchError(onError);
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    print(response.statusCode);

    if (response.statusCode == 201) {
      User authUser = User.fromJson(responseData);
      ScreenPref().setScreenPref();

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser,
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration Failed',
        'data': responseData,
      };
    }
    print(result);
    return result;
  }

  static onError(error) {
    return {
      'status': false,
      'message': 'Unsuccessful request',
      'data': error,
    };
  }
}
