import 'dart:convert';
import 'package:pet_app/Prefrence.dart';
import '../../UTILS/Utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

var Sinupmsg;
var signupEmail;

Future Sinup(String email, password, confirmPassword) async {
  var response = await http.post(Uri.parse(Base_URL + SIGNUP), body: {
    'email': email,
    'password': password,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      Preference.Pref.setString('email', email).toString();
      signupEmail = Preference.Pref.getString('email').toString();
      return data;
    } else {
      Sinupmsg = data['message'];
      print("=======" + Sinupmsg.toString());
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
