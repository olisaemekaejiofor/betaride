import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart';
import 'package:mybetaride/helpers/app_url.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/main.dart';
import 'package:mybetaride/models/profile_model.dart';
import 'package:mybetaride/models/schedule_model.dart';
import 'package:mybetaride/models/state_model.dart';
import 'package:mybetaride/models/terminals_model.dart';

class ScheduleService {
  final url = "https://mybetaride.herokuapp.com/api/v1/schedule/activeschedules";
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

        return schedule;
      }
    } else {
      return null;
    }
  }
}

class ProfileService {
  final url = "https://mybetaride.herokuapp.com/api/v1/auth/me";
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

  Future futurecheck() async {
    int pageIndex = await getIndex();
    print(pageIndex);
    List listCheck = [pageIndex];
    var connectivityReult = await (Connectivity().checkConnectivity());
    if (connectivityReult == ConnectivityResult.mobile) {
      listCheck.add(true);
      return listCheck;
    } else if (connectivityReult == ConnectivityResult.wifi) {
      listCheck.add(true);
      return listCheck;
    }
    listCheck.add(false);
    return listCheck;
  }
}

class CheckDriver {
  Future<bool> check() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    var res = await get(Uri.parse(AppUrl.getVehicle), headers: headers);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      List<dynamic> vehicleData = data['data'];
      print(vehicleData);
      if (vehicleData.length == 0) {
        return false;
      } else {
        return true;
      }
    } else {
      return null;
    }
  }
}
