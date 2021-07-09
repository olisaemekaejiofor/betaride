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
  NotUploaded,
  LoggedIn,
  Registered,
  Uploaded,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthProvider extends ChangeNotifier {
  Status _loggedinStatus = Status.NotLoggedIn;
  Status _registeredStatus = Status.NotRegistered;
  Status _uploadedStatus = Status.NotUploaded;

  Status get loggedinStatus => _loggedinStatus;

  set loggedinStatus(Status value) {
    _loggedinStatus = value;
    notifyListeners();
  }

  Status get registeredStatus => _registeredStatus;

  set registeredStatus(Status value) {
    _registeredStatus = value;
    notifyListeners();
  }

  Status get uploadedStatus => _uploadedStatus;

  set uploadedStatus(Status value) {
    _uploadedStatus = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, dynamic> apiBodyData = {
      "role": "driver",
      "email": email,
      "password": password,
    };

    return await post(
      Uri.parse(AppUrl.login),
      body: json.encode(apiBodyData),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwMmQ0ZGRjMjg0YzBlNmU4NDlkNmUyZCIsInJvbGUiOiJkcml2ZXIiLCJpYXQiOjE2MjI1MzU2MzMsImV4cCI6MTYyMzE0MDQzM30.pcbwA5QQJSmI1sXDdpZXl5dPuWF0hOsGQZjmpF8ACY8',
        'Content-Type': 'application/json'
      },
    ).then(onValue).catchError(onError);
  }

  Future<Map<String, dynamic>> register(
    String firstname,
    String lastname,
    String email,
    String password,
    String state,
    String phone,
  ) async {
    final Map<String, dynamic> apiBodyData = {
      "firstName": firstname,
      "lastName": lastname,
      "password": password,
      "email": email,
      "address": state,
      "phone": phone,
      "stateOfResidence": state,
      "role": "driver",
    };

    return await post(
      Uri.parse(AppUrl.register),
      body: json.encode(apiBodyData),
      headers: {'Content-Type': 'application/json'},
    ).then(onValue).catchError(onError);
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
