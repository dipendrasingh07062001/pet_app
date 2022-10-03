import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Api/LoginApi.dart';
import 'package:pet_app/Prefrence.dart';

var resendsignupOTPmsg;

Future Resend_OTP_Signup() async {
  var response =
      await http.post(Uri.parse(Base_URL + Signup_Resend_otp), body: {
    'email': Email.toString(),
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      resendsignupOTPmsg = data['message'];

      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
