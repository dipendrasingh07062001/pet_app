import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Prefrence.dart';

var forgotmsg;
Future ForgotPasswordApi(String email) async {
  var response = await http.post(Uri.parse(Base_URL + FORGOT_PASSWORD_SENDOTP),
      body: {'email': email});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);

      Preference.Pref.setString('email', email).toString();

      return data;
    } else {
      forgotmsg = data['message'];
      print("=======" + forgotmsg.toString());
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
