import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Api/LoginApi.dart';
import 'package:pet_app/Prefrence.dart';

var changepasswordmsg;

Future ChangePasswordApi(String oldpassword, String newPassword) async {
  // final userId = Preference.Pref.getInt('id').toString();

  var response = await http.post(Uri.parse(Base_URL + Change_Password), body: {
    'user_id': Userid.toString(),
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

      print("Id   : " + data['data']['id'].toString());

      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
