import 'package:big_test/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class DB {
  saveUser(Map<String, dynamic> data) async {
    var pref = await SharedPreferences.getInstance();
    var jsonString = json.encode(data);
    await pref.setString("user", jsonString);
  }

  Future<LoginModel?> getUser() async {
    var pref = await SharedPreferences.getInstance();
    String? jsonBody = pref.getString("user");
    if (jsonBody != null) {
      final map = json.decode(jsonBody) as Map<String, dynamic>;
      return LoginModel.fromJson(map);
    } else {
      return null;
    }
  }
}
