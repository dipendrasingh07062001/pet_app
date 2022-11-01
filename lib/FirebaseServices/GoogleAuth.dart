import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:http/http.dart' as http;
import '../Api/Prefrence.dart';

String? gname;
String? gemail;
String? gprofilePic;
String? appId;

bool googlesigning = false;

Future googleLogin() async {
  googlesigning = true;
  print("googleLogin method Called");
  GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    var reslut = await _googleSignIn.signIn();
    if (reslut != null) {
      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print("userData: $userData");
      print("credential : $credential");
      print("finalResult : $finalResult");
      print("name   ==:" + reslut.displayName.toString());
      print("email   ==:" + reslut.email.toString());
      print("image==:" + reslut.photoUrl.toString());
      print("AppId==" + reslut.id.toString());
      gname = reslut.displayName.toString();
      gemail = reslut.email.toString();
      gprofilePic = reslut.photoUrl.toString();
      appId = reslut.id.toString();

      googlesigning = false;
      return true;
    }

    return false;
  } catch (error) {
    googlesigning = false;

    print(error);
  }
}

////Google Signing Api

Future socialSigningApi(String email, String name, String type) async {
  var response = await http.post(Uri.parse(baseURL + socialSignup),
      body: {'email': email, 'name': name, 'type': type});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());
    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      Preference.Pref.setString('email', data['data']['email']);
      Preference.Pref.setString('name', data['data']['name']);
      Preference.Pref.setString('type', data['data']['type']);
      Preference.Pref.setInt('userId', data['data']['id']);
      // Preference.Pref.setString('status', data['data']['status']);
      // Preference.Pref.setInt('email_verified', data['data']['email_verified']);
      // Preference.Pref.setString('image', data['data']['image']);
      var id = Preference.Pref.getInt('userId');
      print(id);
      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
