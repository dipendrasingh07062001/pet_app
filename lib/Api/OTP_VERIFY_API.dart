import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Prefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

var lqlmsg;

Future Otp_verify(String email, otp) async {
  Preference.Pref.setString('email', email);
  final getEmail = await Preference.Pref.getString('email');

  var response = await http.post(Uri.parse(Base_URL + OTP_VERIFY), body: {
    'email': getEmail,
    'otp': otp,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"].toString());
      print(response.body);

      lqlmsg = data['message'];

      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
