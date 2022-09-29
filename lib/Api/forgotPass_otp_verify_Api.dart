import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Prefrence.dart';

var forgotmsg;
Future ForgotPass_OTP_VERIFY(String otp) async {
  final getEmail = Preference.Pref.getString('email');

  var response = await http.post(Uri.parse(Base_URL + FORGOT_VERIFY_OTP),
      body: {'email': getEmail, 'otp': otp});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"].toString());
      print(response.body);

      forgotmsg = data['message'];

      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
