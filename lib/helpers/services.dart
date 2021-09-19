import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mybetaride/helpers/app_url.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/profile_model.dart';
import 'package:mybetaride/models/schedule_model.dart';
import 'package:mybetaride/models/state_model.dart';
import 'package:mybetaride/models/terminals_model.dart';
import 'package:mybetaride/views/dashboard/home.dart';

class ScheduleService {
  final url = "https://mybetaride.herokuapp.com/api/v1/schedule/mySchedule";
  Future<List<ScheduleData>> getSchedule() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> data = json['data'];
      if (data == []) {
        return null;
      } else {
        List<ScheduleData> schedule =
            data.map((dynamic item) => ScheduleData.fromJson(item)).toList();
        List<ScheduleData> filtered = schedule.where((s) => s.status == "Offline").toList();
        print(filtered);
        return schedule;
      }
    } else {
      return null;
    }
  }

  Future activate(BuildContext context, String id) async {
    void stop() => Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    var myList = await OnlineOffline().futurecheck();
    print(myList);
    var uurl = "https://mybetaride.herokuapp.com/api/v1/schedule/updateschedule/$id";

    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token', "Content-Type": "application/json"};
    var res = await put(Uri.parse(uurl), headers: headers, body: jsonEncode({"status": "Online"}));
    print(res.statusCode);
    print(res.body);
    if (myList == true) {
      if (res.statusCode == 201) {
        String homePref = await HomePref().getHomeSchedule();
        if (homePref == null || homePref == '') {
          HomePref().setHomeSchedule(id);
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(true, false)));
        } else {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => customAlert(context, stop,
                title: "You already have an active schedule",
                content: "To activate another schedule you have to cancel the current schedule",
                buttonLabel: "Cancel",
                buttonLabel2: "Ignore"),
          );
        }
      } else {
        return null;
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => oneCustomAlert(context,
            title: "Ooops!",
            content:
                "Can't connect to internet right now, please check your network settings and try again.",
            buttonLabel: "OK"),
      );
    }
  }
}

class ProfileService {
  // StreamController<ProfileData> _controller;
  // Stream<ProfileData> get streamGetProfile => _controller.stream;
  // final sub = _controller.stream.listen((ProfileData profile) {
  //   return profile;
  // });

  final url = "https://mybetaride.herokuapp.com/api/v1/auth/me";
  Stream<ProfileData> streamGetProfile() async* {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      Map<String, dynamic> data = json['data'];
      ProfileData profile = ProfileData.fromJson(data);

      yield profile;
    } else {
      print("Cant get profile");
      yield null;
    }
  }

  Future<ProfileData> getProfile() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      Map<String, dynamic> data = json['data'];
      ProfileData profile = ProfileData.fromJson(data);

      return profile;
    } else {
      print("Cant get profile");
      return null;
    }
  }
}

class StateService {
  final url1 = "https://mybetaride.herokuapp.com/api/v1/state/";
  Future<List<StateData>> getStates() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url1), headers: headers);

    if (res.statusCode == 201) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> data = json['data'];
      List<StateData> states = data.map((dynamic item) => StateData.fromJson(item)).toList();
      return states;
    } else {
      print('cant get states');
      return null;
    }
  }

  Future<StateData> getState(String stateId) async {
    var url2 = "https://mybetaride.herokuapp.com/api/v1/state/" + stateId;
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url2), headers: headers);

    if (res.statusCode == 201) {
      Map<String, dynamic> json = jsonDecode(res.body);
      Map<String, dynamic> data = json['data'];
      StateData state = StateData.fromJson(data);

      return state;
    } else {
      return null;
    }
  }
}

class TerminalService {
  final url = "https://mybetaride.herokuapp.com/api/v1/terminals/";
  Future<List<TerminalData>> getTerminal() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> data = json['data'];
      List<TerminalData> terminals =
          data.map((dynamic item) => TerminalData.fromJson(item)).toList();
      return terminals;
    } else {
      print("Cant get Terminals");
      return null;
    }
  }
}

class VehicleService {
  final url = "https://mybetaride.herokuapp.com/api/v1/auth/me/vehicle";
  Future<String> getVehicle() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      var data = json['data'];
      List<dynamic> vehicle = data['vehicle'];
      String id = vehicle[0]['_id'];
      return id;
    } else {
      print('cant get id');
      return null;
    }
  }
}

class OnlineOffline {
  Stream<bool> streamcheck() async* {
    var connectivityReult = await (Connectivity().checkConnectivity());
    if (connectivityReult == ConnectivityResult.mobile) {
      yield true;
    } else if (connectivityReult == ConnectivityResult.wifi) {
      yield true;
    }
    yield false;
  }

  Future<bool> futurecheck() async {
    var connectivityReult = await (Connectivity().checkConnectivity());
    if (connectivityReult == ConnectivityResult.mobile) {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else if (connectivityReult == ConnectivityResult.wifi) {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}

class CheckDriver {
  Future<String> check() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    var res = await get(Uri.parse(AppUrl.getVehicle), headers: headers);
    var another = await get(Uri.parse(AppUrl.docUpload), headers: headers);
    if (res.statusCode == 200 && another.statusCode == 200) {
      var data = jsonDecode(res.body);
      var anotherData = jsonDecode(another.body);
      List<dynamic> vehicleData = data['data'];
      List<dynamic> docData = anotherData['data'];
      print(vehicleData);
      print(docData);
      if (vehicleData.length == 0) {
        return "Unverified";
      } else if (vehicleData[0]['status'] == "Unverified" && docData.length == 0) {
        return "Unverified";
      } else if (docData.length > 0 && vehicleData[0]['status'] == "Unverified") {
        return "Pending";
      } else {
        return "Verified";
      }
    }
    return "Error";
  }
}
