import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Prefrence.dart';

var resetmsg;
Future Reset_PasswordApi(
  String email,
  String newpassword,
) async {
  var response = await http.post(Uri.parse(Base_URL + RESET_PASSWORD), body: {
    'email': email,
    'newpassword': newpassword,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      resetmsg = data['message'];

      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
