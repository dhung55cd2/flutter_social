
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  read ( String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return json.decode(sharedPreferences.getString(key));
  }
  save ( String key , value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, json.encode(value));
  }
  removie(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}