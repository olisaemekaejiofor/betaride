import 'dart:convert';

import 'package:http/http.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/models/profile_model.dart';
import 'package:mybetaride/models/schedule_model.dart';

class ScheduleService {
  final url = "https://mybetaride.herokuapp.com/api/v1/schedule";
  Future<List<ScheduleData>> getSchedule() async {
    String token = await UserPref().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    Response res = await get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      print(json);
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
      print(json);
      Map<String, dynamic> data = json['data'];
      ProfileData profile = ProfileData.fromJson(data);

      return profile;
    } else {
      print("Cant get profile");
      return null;
    }
  }
}
