import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Prefrence.dart';

var changepasswordmsg;
Future ChangePasswordApi(String oldpassword, String newPassword) async {
  final userId = Preference.Pref.getInt('id').toString();
  var response = await http.post(Uri.parse(Base_URL + Change_Password), body: {
    'user_id': userId,
    'oldpassword': oldpassword,
    'newpassword': newPassword
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      changepasswordmsg = data['message'];
      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
