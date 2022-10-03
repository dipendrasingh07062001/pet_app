import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Prefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiBaseUrl.dart';

var loginmsg;
var Userid;
var userImage;
var Email;
var userName;

Future LoginApi(
  String email,
  password,
) async {
  var response = await http.post(Uri.parse(Base_URL + LOGIN), body: {
    'email': email,
    'password': password,
  });

  if (response.statusCode == 200) {
    var value = jsonDecode(response.body);
    print("data" + value.toString());

    if (value["status"] == true) {
      print(value["message"]);
      print(response.body);

      Preference.Pref.setString('image', value['data']['image'].toString());
      Preference.Pref.setInt('id', value['data']['id']);
      Preference.Pref.setString('email', value['data']['email'].toString());
      Preference.Pref.setString('name', value['data']['name'].toString());
      Preference.Pref.setString('status', value['data']['status'].toString());
      Preference.Pref.setBool("isFirstTimeUser", true) ?? true;

      final getid = Preference.Pref.getInt('id');

      Userid = Preference.Pref.getInt('id').toString();
      userName = Preference.Pref.getString('name').toString();
      userImage = Preference.Pref.getString('image');
      Email = Preference.Pref.getString('email');
      print("Image ==== " + value['data']['image']);
      print('User Id : ' + Userid.toString());

      return value;
    } else {
      loginmsg = value['message'];
      return Future.error(value["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
