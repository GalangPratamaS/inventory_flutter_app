import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> save(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, jsonEncode(value)
    );

  }

  Future<bool> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? prefsString = prefs.getString(key);
    if(prefsString == null){
      return jsonDecode('false');
    } else {
      return jsonDecode(prefsString);
    }
  }

  Future remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }


}