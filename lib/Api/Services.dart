//// login Api
///
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/Models/blogModel.dart';
import 'package:pet_app/Api/Models/getBreedModel.dart';
import 'package:pet_app/Api/Models/getDewormingModel.dart';
import 'package:pet_app/Api/Models/getMedicineModel.dart';
import 'package:pet_app/Api/Models/getMedicineNameModel.dart';
import 'package:pet_app/Api/Models/remindermodel.dart';
import 'package:pet_app/Api/Models/v_model.dart';
import 'package:pet_app/Api/Models/vaccinationModel.dart';
import 'package:pet_app/AppServices/database.dart';
import 'package:pet_app/Notification/notificationMathod.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:pet_app/Provider/predictionProvider.dart';
import 'package:pet_app/Screens/Reminder.dart';
import 'package:provider/provider.dart';
import '../Provider/Reminder_provider.dart';
import '../Screens/Onbording/Login.dart';
import '../Testing1/linearCalender.dart';
import '../UTILS/Utils.dart';
import 'ApiBaseUrl.dart';
import 'Models/My_pet_model.dart';
import 'Models/ServiceListModel.dart';
import 'Models/addPetModel.dart';
import 'Models/cycleTrackingBlogModel.dart';
import 'Models/getPregnancyModel.dart';
import 'Models/schedulemodel.dart';
import 'Prefrence.dart';

String? loginmsg;
var headers = {
  'Authorization': 'Bearer ' + Preference.Pref.getString("token"),
  // "Content-Type": "application/json"
};

bool islogin = false;
Future LoginApi(
  String email,
  password,
) async {
  var response = await http.post(Uri.parse(baseURL + login), body: {
    'email': email,
    'password': password,
  });
  islogin = true;

  if (response.statusCode == 200) {
    var value = jsonDecode(response.body);
    print("data" + value.toString());

    if (value["status"] == true) {
      print(value["message"]);
      print(response.body);

      Preference.Pref.setString('image', value['data']['image'] ?? "");
      Preference.Pref.setInt('userId', value['data']['id'] ?? "");
      Preference.Pref.setString('email', value['data']['email'] ?? "");
      Preference.Pref.setString('name', value['data']['name'] ?? "");
      Preference.Pref.setString('status', value['data']['status'].toString());
      Preference.Pref.setString('token', value['token']);
      Preference.Pref.setBool("isFirstTimeUser", false);

      final Userid = Preference.Pref.getInt('userId').toString();
      print("user id ====$Userid");
      final userName = Preference.Pref.getString('name').toString();
      print("user  ====$userName");
      final userImage = Preference.Pref.getString('image');
      final Email = Preference.Pref.getString('email');
      print("Image ==== " + value['data']['image']);
      print('User Id : ' + Userid);
      islogin = false;
      return value;
    } else {
      islogin = false;
      loginmsg = value['message'];
      return Future.error(value["message"]);
    }
  } else {
    islogin = false;
    return Future.error("Server Error");
  }
}

///Signup Api

String? Sinupmsg;
String? signupEmail;

Future Sinup(
  String email,
  password,
  confirmPassword,
) async {
  var response = await http.post(Uri.parse(baseURL + signup), body: {
    'email': email,
    'password': password,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      Preference.Pref.setString('email', email);
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

//// reset password Api
///

String? resetmsg;
Future Reset_PasswordApi(
  String email,
  String newpassword,
) async {
  var response = await http.post(Uri.parse(baseURL + resetPassword), body: {
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

////resend otp signup Api
///

bool resendotpsinuploading = false;
String? resendsignupOTPmsg;

Future Resend_OTP_Signup() async {
  final userEmail = Preference.Pref.getString('email').toString();
  var response = await http.post(Uri.parse(baseURL + signupResendOtp), body: {
    'email': userEmail.toString(),
  });
  resendotpsinuploading = true;
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      resendsignupOTPmsg = data['message'].toString();
      resendotpsinuploading = false;
      return data;
    } else {
      resendotpsinuploading = false;
      return Future.error(data["message"]);
    }
  } else {
    resendotpsinuploading = false;
    return Future.error("Server Error");
  }
}

//// resend otp forgot password
///
String? resendOTPmsg;

bool resendotploading = false;
Future Resend_OTP_ForgotPassword() async {
  var response = await http.post(Uri.parse(baseURL + forgotResendOtp), body: {
    'email': resendotpemail.toString(),
  });
  bool resendotploading = true;

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      resendOTPmsg = data['message'];
      bool resendotploading = false;

      return data;
    } else {
      bool resendotploading = false;

      return Future.error(data["message"]);
    }
  } else {
    bool resendotploading = false;

    return Future.error("Server Error");
  }
}

////  signup otp verify Api
///
String? lqlmsg;

bool isLoadingOtp = false;

Future otpVerifySinup(String otp) async {
  var response = await http.post(Uri.parse(baseURL + otpVerify), body: {
    'email': signupEmail,
    'otp': otp,
  });

  isLoadingOtp = true;

  if (response.statusCode == 200) {
    isLoadingOtp = true;
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"].toString());
      print(response.body);

      lqlmsg = data['message'];
      Preference.Pref.setString('token', data["token"]);
      Preference.Pref.setString('image', data['data']['image'].toString());
      Preference.Pref.setString('email', data['data']['email'].toString());
      Preference.Pref.setString('name', data['data']['name'].toString());
      Preference.Pref.setString('status', data['data']['status'].toString());
      Preference.Pref.setInt('userId', data['data']['id']);

      isLoadingOtp = false;

      return data;
    } else {
      isLoadingOtp = false;
      return Future.error(data["message"]);
    }
  } else {
    isLoadingOtp = false;
    return Future.error("Server Error");
  }
}

//// forgot password api
///

String? forgotmsg;
String? resendotpemail;
bool isforgotpassword = false;
Future ForgotPasswordApi(String email) async {
  var response = await http
      .post(Uri.parse(baseURL + forgotPasswordSendOtp), body: {'email': email});
  isforgotpassword = true;

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);

      Preference.Pref.setString('email', email.toString()).toString();

      resendotpemail = Preference.Pref.getString('email').toString();
      isforgotpassword = false;
      return data;
    } else {
      isforgotpassword = false;
      forgotmsg = data['message'];
      print("=======" + forgotmsg.toString());
      return Future.error(data["message"]);
    }
  } else {
    isforgotpassword = false;
    return Future.error("Server Error");
  }
}

//// forgot password otp verify api
///
bool isLoadingforgotOtp = false;

String? forgotpassotpmsg;
Future ForgotPass_OTP_VERIFY(String otp) async {
  final userEmail = Preference.Pref.getString('eamil').toString();
  var response = await http.post(
    Uri.parse(baseURL + forgotVerifyOtp),
    body: {'email': resendotpemail, 'otp': otp},
  );
  isLoadingforgotOtp = true;
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"].toString());
      print(response.body);

      forgotpassotpmsg = data['message'].toString();
      isLoadingforgotOtp = false;
      return data;
    } else {
      isLoadingforgotOtp = false;
      return Future.error(data["message"]);
    }
  } else {
    isLoadingforgotOtp = false;
    return Future.error("Server Error");
  }
}

//// change password api
///
String? changepasswordmsg;
bool isChangepassword = false;
Future ChangePasswordApi(
    int userid, String oldpassword, String newPassword) async {
  // final userId = Preference.Pref.getInt('userId').toString();

  var response = await http.post(
    Uri.parse(baseURL + changePassword),
    body: {
      'user_id': userid.toString(),
      'oldpassword': oldpassword,
      'newpassword': newPassword
    },
    headers: headers,
  );
  isChangepassword = true;
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);
      changepasswordmsg = data['message'];

      print("Id   : " + data['data']['id'].toString());
      isChangepassword = false;
      return data;
    } else {
      isChangepassword = false;
      return Future.error(data["message"]);
    }
  } else {
    isChangepassword = false;
    return Future.error("Server Error");
  }
}

////  Dashbord get service  list api
///

Future servicelistApi(BuildContext context, [String search = ""]) async {
  String qwe = "?key$search";
  ServiceModel result = ServiceModel();
  var response = await http.get(
    Uri.parse(baseURL + getService + (search == "" ? "" : qwe)),
    headers: {
      "Authorization": "Bearer " + Preference.Pref.getString("token"),
    },
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status']) {
      result = ServiceModel.fromjson(data);
      print(result);
      return result;
    } else {
      return Future.error(data['message']);
    }
  } else if (response.statusCode == 401) {
    floatingsnackbar(context, "session has expired please log in again");
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    Navigate_PushRemove(context, Login());
  } else {
    return Future.error('Server error');
  }
}

//// get my pet list api
///

// var petid;
Future mypetApi() async {
  MyPetModel result = MyPetModel();
  var response = await http.get(
    Uri.parse(
      baseURL +
          getMyPet +
          "?user_id=" +
          Preference.Pref.getInt("userId").toString(),
    ),
    headers: {
      "Authorization": "Bearer " + Preference.Pref.getString("token"),
    },
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status']) {
      result = MyPetModel.fromjson(data);

      print(result);
      mypetmoellist.clear();
      mypetmoellist.addAll(result.mypetdata!);
      Preference.Pref.getInt('selectedPetId') ??
          Preference.Pref.setInt('selectedPetId', mypetmoellist[0].id);
      Preference.Pref.getString('selectedPetName') ??
          Preference.Pref.setString('selectedPetName', mypetmoellist[0].name);
      Preference.Pref.getString('selectedPetGender') ??
          Preference.Pref.setString(
              'selectedPetGender', mypetmoellist[0].gendar);

      return result.mypetdata;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// delete my pet api

String? deletepetmsg;
Future deletepetApi(String id) async {
  var response = await http.post(
    Uri.parse(baseURL + deletepet),
    body: {'pet_id': id},
    headers: {
      "Authorization": "Bearer " + Preference.Pref.getString("token"),
    },
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status']) {
      print(data);
      deletepetmsg = data['message'].toString();
      return data;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

////getBreedApi

List<GetBreedModel> breedlist = [];
bool breedLoading = false;

Future getBreedApi() async {
  breedLoading = true;

  var response = await http.get(
    Uri.parse(baseURL + getBreedPet),
    headers: {
      "Authorization": "Bearer " + Preference.Pref.getString("token"),
    },
  );
  var jsonRes;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    jsonRes = data['data'];
    if (data['status'] == true) {
      List list = jsonRes;
      breedlist.clear();
      // breedlist.add(breedModel);
      if (AddPetModel.breed != null) {
        breedlist.add(AddPetModel.breed!);
      }
      breedlist.addAll(getBreedModelFromJson(jsonEncode(list)));
      breedLoading = false;

      // breedlist.addAll(list.map((e) => GetBreedModel.fromJson(e)).toList());
      // return breedlist;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// add pet Api
///

String? addpetmsg;
Future addPetApi(
    String type,
    String name,
    String parentname,
    String breed,
    String gender,
    String weight,
    String dob,
    List<File?> image,
    File? documnt) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + addpet),
  );

  if (image.isNotEmpty) {
    image.forEach((element) {
      request.files.add(
        http.MultipartFile(
          'image[]',
          element!.readAsBytes().asStream(),
          element.lengthSync(),
          filename: element.path.split("/").last,
        ),
      );
    });
  }
  request.headers.addAll(headers);

  if (documnt != null) {
    request.files.add(
      http.MultipartFile(
        'upload_document',
        documnt.readAsBytes().asStream(),
        documnt.lengthSync(),
        filename: documnt.path.split("/").last,
      ),
    );
  }

  request.fields.addAll({
    'type': type,
    'name': name,
    'parent_name': parentname,
    'breed': breed,
    'gendar': gender,
    'weight': weight,
    'dob': dob,
    'user_id': Preference.Pref.getInt("userId").toString()
  });

  print(request.toString());
  var response = await request.send();
  print(response.toString());

  if (response.statusCode == 200) {
    var data = await response.stream.bytesToString();
    var jsoncode = jsonDecode(data);

    if (jsoncode['status'] == true) {
      print(data);
      addpetmsg = jsoncode['message'].toString();
      return jsoncode;
    } else {
      return Future.error(jsoncode['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// edit pet Api

String? editpetmsg;
Future editPetApi(
  String petId,
  String type,
  String name,
  String parentname,
  String breed,
  String gender,
  String weight,
  String dob,
  List<File?> image,
  List<String?> image2,
  File? documnt,
) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + editPet),
  );

  request.headers.addAll(headers);
  if (image2.isNotEmpty) {
    request.fields.addAll({
      "left_images": image2.join(","),
    });
  }
  if (image.isNotEmpty) {
    image.forEach((element) {
      request.files.add(
        http.MultipartFile(
          'image[]',
          element!.readAsBytes().asStream(),
          element.lengthSync(),
          filename: element.path.split("/").last,
        ),
      );
    });
  }

  if (documnt?.path != null) {
    request.files.add(
      http.MultipartFile(
        'upload_document',
        documnt!.readAsBytes().asStream(),
        documnt.lengthSync(),
        filename: documnt.path.split("/").last,
      ),
    );
  }
  request.fields.addAll({
    'id': petId,
    'type': type,
    'name': name,
    'parent_name': parentname,
    'breed': breed,
    'gendar': gender,
    'weight': weight,
    'dob': dob,
  });
  print(request.toString());
  var response = await request.send();
  print(response.toString());

  if (response.statusCode == 200) {
    var data = await response.stream.bytesToString();
    var jsoncode = jsonDecode(data);

    if (jsoncode['status']) {
      print(data);
      editpetmsg = jsoncode['message'].toString();
      print(editpetmsg);
      return jsoncode;
    } else {
      return Future.error(jsoncode['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// get blog Api
////

Future getblogApi() async {
  BlogModel result = BlogModel();

  var response = await http.get(Uri.parse(baseURL + getBlog), headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      result = BlogModel.fromjson(data);
      print(result);

      return result;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// get CycleTracking blog Api
////

Future getCycleTrackingblogApi() async {
  CycleTackingBlogModel result = CycleTackingBlogModel();

  var response =
      await http.get(Uri.parse(baseURL + cycleTrackingBlog), headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      result = CycleTackingBlogModel.fromjson(data);
      print(result);

      return result;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// get Vccination Api

Future getVaccinationListApi() async {
  VaccinationMaodel result = VaccinationMaodel();

  try {
    var response = await http.get(
        Uri.parse(baseURL +
            getVaccinationList +
            "?pet_id=" +
            Preference.Pref.getInt("selectedPetId").toString()),
        headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        result = VaccinationMaodel.fromjson(data);
        print(result);

        return result;
      } else {
        return Future.error(data['message']);
      }
    } else {
      return Future.error('Server error');
    }
  } catch (e) {
    // TODO
    print("error $e");
  }
}

//// delete Vaccination api

String? deleteVaccinationmsg;
Future deleteVaccintionApi(String vaccinationId) async {
  var response = await http.post(Uri.parse(baseURL + deleteVaccination),
      body: {'vaccination_id': vaccinationId}, headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status']) {
      print(data);
      deleteVaccinationmsg = data['message'].toString();
      return data;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

////getVaccinationApi

List<VModel> vaccinationList = [];

Future getVaccinationApi() async {
  var response =
      await http.get(Uri.parse(baseURL + getVacination), headers: headers);
  var jsonRes;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    jsonRes = data['data'];
    if (data['status'] == true) {
      List list = jsonRes;
      vaccinationList.addAll(vModelFromJson(jsonEncode(list)));
      // vaccinationList.addAll(list.map((e) => VModel.fromJson(e)).toList());
      print(vaccinationList.toString());

      return data;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// add Vaccination Api
bool addvaccination = false;
String? addVaccinationmsg;
Future addVaccinationApi(
  String vaccinationName,
  // String vaccinationStatus,
  String vaccinationdate,
  File vaccinationCertificate,
  String reminder,
  String atdate,
  String attime,
  String dose,
) async {
  ///MultiPart request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + addVaccination),
  );

  if (vaccinationCertificate.path.isNotEmpty) {
    request.files.add(
      http.MultipartFile(
        'vaccination_certificatee',
        vaccinationCertificate.readAsBytes().asStream(),
        vaccinationCertificate.lengthSync(),
        filename: vaccinationCertificate.path.split("/").last,
      ),
    );
  }
  request.headers.addAll(headers);
  if (vaccinationdate != "null" && vaccinationdate != "") {
    request.fields["vaccination_date"] = vaccinationdate;
  }
  request.fields.addAll({
    'user_id': Preference.Pref.getInt("userId").toString(),
    'dose': dose,
    'vaccination_id': vaccinationName,
    // 'vaccination_status': vaccinationStatus,
    // 'vaccination_date': vaccinationdate,
    'reminder': reminder,
    'at_date': atdate,
    'at_time': attime,
    'pet_id': Preference.Pref.getInt('selectedPetId').toString()
  });
  addvaccination = true;
  print(request.toString());
  var res = await request.send();
  print(res.toString());

  if (res.statusCode == 200) {
    final data = await res.stream.bytesToString();
    var jsoncode = jsonDecode(data);

    if (jsoncode['status'] == true) {
      print(data);
      addVaccinationmsg = jsoncode['message'].toString();
      addvaccination = false;

      return jsoncode;
    } else {
      addvaccination = false;

      return Future.error(jsoncode['message']);
    }
  } else {
    addvaccination = false;

    return Future.error('Server error');
  }
}

//// edit Vaccination Api
///
bool iseditvaccion = false;
String? editvaccinationmsg;
Future editVaccinationApi(
    String vaccinationName,
    String vaccinationStatus,
    String vaccinationdate,
    File vaccinationCertificate,
    String reminder,
    String atdate,
    String attime,
    String dose,
    String editImageUrl) async {
  ///MultiPart request
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://appicsoftwares.in/development/petapp/api/edit_vaccinations") //baseURL + editvaccination),
      );
  request.headers.addAll(headers);
  if (vaccinationdate != "null" && vaccinationdate != "") {
    request.fields["vaccination_date"] = vaccinationdate;
  }
  if (vaccinationCertificate.path.isNotEmpty) {
    request.files.add(
      http.MultipartFile(
        'vaccination_certificatee',
        vaccinationCertificate.readAsBytes().asStream(),
        vaccinationCertificate.lengthSync(),
        filename: vaccinationCertificate.path.split("/").last,
      ),
    );

    request.fields.addAll({
      'user_id': Preference.Pref.getInt("userId").toString(),
      'pet_id': Preference.Pref.getInt("selectedPetId").toString(),
      'vaccination_id': vaccinationName,
      'vaccination_status': vaccinationStatus,
      'reminder': reminder,
      'at_date': atdate,
      'at_time': attime,
      'dose': dose,
      'id': Preference.Pref.getInt('vaccinationId').toString(),
    });
  } else {
    request.fields.addAll({
      'user_id': Preference.Pref.getInt("userId").toString(),
      'pet_id': Preference.Pref.getInt("selectedPetId").toString(),
      'vaccination_id': vaccinationName,
      'vaccination_status': vaccinationStatus,
      'reminder': reminder,
      'at_date': atdate,
      'dose': dose,
      'at_time': attime,
      'id': Preference.Pref.getInt('vaccinationId').toString(),
      'vaccination_certificatee': editImageUrl
    });
  }

  iseditvaccion = true;
  var res = await request.send();

  if (res.statusCode == 200) {
    final data = await res.stream.bytesToString();
    var jsoncode = jsonDecode(data);

    if (jsoncode['status'] == true) {
      print(data);
      editvaccinationmsg = jsoncode['message'].toString();
      iseditvaccion = false;
      return jsoncode;
    } else {
      iseditvaccion = false;
      return Future.error(jsoncode['message']);
    }
  } else {
    iseditvaccion = false;
    return Future.error('Server error');
  }
}

// get Deworming Api

Future getDewormingListApi(String petid) async {
  GetdewormingModelList result = GetdewormingModelList();
  var response = await http.get(
      Uri.parse(baseURL + getDewormingList + "?pet_id=$petid"),
      headers: headers);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      result = GetdewormingModelList.fromJson(data);
      print(result);
      return result;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

/// add Dewormong Api
///

String? addDewormingmsg;
bool isAddDeworming = false;
Future addDewormingApi(String duration, String date, String reminder,
    String atDate, String time) async {
  var response = await http
      .post(Uri.parse(baseURL + addDeworming), headers: headers, body: {
    'pet_id': Preference.Pref.getInt('selectedPetId').toString(),
    'user_id': Preference.Pref.getInt('userId').toString(),
    // 'deworming_status': status,
    // 'deworming_duration': duration,
    "deworming_date": date,
    'reminder': reminder,
    'at_date': atDate,
    'at_time': time
  });
  isAddDeworming = true;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      print(data['message']);
      print(data['data']);
      addDewormingmsg = data['message'].toString();
      isAddDeworming = false;
      return data;
    } else {
      isAddDeworming = false;
      return Future.error(data['message']);
    }
  } else {
    isAddDeworming = false;
    return Future.error('Server error');
  }
}

/// edit Deworming Api

String? editDewormingmsg;
bool iseditDeworming = false;
Future editDewormingApi(String status, String duration, String date,
    String remindr, String atDate, String attime) async {
  var response = await http
      .post(Uri.parse(baseURL + editDeworming), headers: headers, body: {
    'pet_id': Preference.Pref.getInt("selectedPetId").toString(),
    'deworming_status': status,
    'deworming_duration': duration,
    'deworming_date': date,
    'reminder': remindr,
    'at_date': atDate,
    'at_time': attime,
    'id': Preference.Pref.getInt('dewormingId').toString()
  });
  iseditDeworming = true;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    if (data['status'] == true) {
      print(data['message']);
      print(data['data']);
      editDewormingmsg = data['message'].toString();
      iseditDeworming = false;
      return data;
    } else {
      iseditDeworming = false;
      Future.error(data['message']);
    }
  } else {
    iseditDeworming = false;
    return Future.error('Server error');
  }
}

//// addd Pregnancy Api
bool isaddpregnancy = false;
String? addPregnancysg;
Future addPregnancyApi(
  String sexuallyActive,
  String pastPregnancy,
  String previousLitter,
  String nuetered,
  String reminder,
  String time,
  String date,
) async {
  var response = await http
      .post(Uri.parse(baseURL + addPregnancy), headers: headers, body: {
    'sexually_active': sexuallyActive,
    'past_pregnancy': pastPregnancy,
    'previous_litter': previousLitter,
    'neutered': nuetered,
    'reminder': reminder,
    'at_time': time,
    'at_date': date,
    'pet_id': Preference.Pref.getInt('selectedPetId').toString()
  });
  isaddpregnancy = true;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data['status'] == true) {
      addPregnancysg = data['message'].toString();
      isaddpregnancy = false;
      return data;
    } else {
      isaddpregnancy = false;
      return Future.error(data['message']);
    }
  } else {
    isaddpregnancy = false;
    return Future.error('Server error');
  }
}

//// edit Pregnancy Api
bool iseditpregnancy = false;
Future editPregnancyApi(
  String sexuallyActive,
  String pastPregnancy,
  String previousLitter,
  String nuetered,
  String reminder,
  String time,
  String date,
) async {
  var response = await http
      .post(Uri.parse(baseURL + editPregnancy), headers: headers, body: {
    'sexually_active': sexuallyActive,
    'past_pregnancy': pastPregnancy,
    'previous_litter': previousLitter,
    'neutered': nuetered,
    'reminder': reminder,
    'at_time': time,
    'at_date': date,
    'id': Preference.Pref.getInt('pregnancyId').toString()
  });
  iseditpregnancy = true;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data['status'] == true) {
      iseditpregnancy = false;

      return data;
    } else {
      iseditpregnancy = false;
      return Future.error(data['message']);
    }
  } else {
    iseditpregnancy = false;
    return Future.error('Server error');
  }
}

// get Pregnancy Api

Future getPregnancyListApi(String petId) async {
  GetPregnancyModel result = GetPregnancyModel();
  var response = await http.get(
      Uri.parse(baseURL + getPregnancy + "?pet_id=$petId"),
      headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      result = GetPregnancyModel.fromJson(data);
      print(result);
      return result;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// get Medicine List Api
///
Future getMedicineListApi(String petId) async {
  GetMedicineModel result = GetMedicineModel();
  var response = await http.get(
      Uri.parse(baseURL + getMedicine + "?pet_id=$petId"),
      headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      result = GetMedicineModel.fromjson(data);
      print(result);
      return result;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// delete Vaccination
String? deleteMedicinemsg;
Future deleteMedicineApi(String medicineId) async {
  var response = await http.post(Uri.parse(baseURL + deletemedicine),
      headers: headers, body: {'medicine_id': medicineId});
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      print(data['message']);
      deleteMedicinemsg = data['message'].toString();
      return data;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

///// getMedicicnename api

List<GetMedicineNameModel> medicinenamelist = [];

Future getMedicineNameApi() async {
  var response =
      await http.get(Uri.parse(baseURL + getMedicinename), headers: headers);
  var jsonRes;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    jsonRes = data['data'];
    if (data['status'] == true) {
      // List list = jsonRes;
      medicinenamelist
          .addAll(GetMedicineNameModelFromJson(jsonEncode(jsonRes)));
      print(medicinenamelist);
      return data;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// Add Medicine Api
bool isaddmedicine = false;

Future addMedicineApi(
  String medicineName,
  String duration,
  String dose,
  String startDate,
  String enddate,
  String reminder,
  String attime,
) async {
  var response = await http
      .post(Uri.parse(baseURL + addMedicine), headers: headers, body: {
    'pet_id': Preference.Pref.getInt("selectedPetId").toString(),
    'medicine_name': medicineName,
    "user_id": Preference.Pref.getInt("userId").toString(),
    'duration': duration,
    'does': dose,
    'course_start_date': startDate,
    'course_end_date': enddate,
    'reminder': reminder,
    'at_time': attime,
  });
  isaddmedicine = true;

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      print(data['message']);
      isaddmedicine = false;
      return data;
    } else {
      isaddmedicine = false;
      return Future.error(data['message']);
    }
  } else {
    isaddmedicine = false;

    return Future.error('Server error');
  }
}

//// edit Medicine Api
bool isdeditingmedicine = false;
Future EditMedicineApi(
  String medicineName,
  String duration,
  String dose,
  String startDate,
  String enddate,
  String reminder,
  String attime,
  String medicineId,
) async {
  var response = await http
      .post(Uri.parse(baseURL + editMedicine), headers: headers, body: {
    'medicine_name': medicineName,
    'duration': duration,
    'does': dose,
    'course_start_date': startDate,
    'course_end_date': enddate,
    'reminder': reminder,
    'at_time': attime,
    "user_id": Preference.Pref.getInt("userId").toString(),
    'id': medicineId,
  });
  isdeditingmedicine = true;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      print(data['message']);
      isdeditingmedicine = false;
      return data;
    } else {
      isdeditingmedicine = false;

      return Future.error(data['message']);
    }
  } else {
    isdeditingmedicine = false;

    return Future.error('Server error');
  }
}

Future editDocument(String docName, File doc, BuildContext context) async {
  ///MultiPart request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + editDocumentUrl),
  );
  if (doc.path.isNotEmpty) {
    request.files.add(
      http.MultipartFile(
        'upload_document',
        doc.readAsBytes().asStream(),
        doc.lengthSync(),
        filename: doc.path.split("/").last,
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
      'document_name': docName,
      'pet_id': Preference.Pref.getInt('selectedPetId').toString(),
    });
  }
  var res = await request.send();

  if (res.statusCode == 200) {
    final data = await res.stream.bytesToString();
    var jsoncode = jsonDecode(data);
    if (jsoncode['status'] == true) {
      print(data);
      customSnackbar(context, jsoncode["message"]);
      Navigator.pop(context);
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future update_profile(
  String name,
  File image,
  String mobile,
  BuildContext context, [
  String image2 = "",
]) async {
  ///MultiPart request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + profile_update_url),
  );
  request.headers.addAll(headers);
  request.fields.addAll({
    'name': name,
    'phone': mobile,
    'userId': Preference.Pref.getInt('userId').toString(),
  });
  if (image2 != "") {
    request.fields.addAll({
      'name': name,
      'phone': mobile,
      'image': image2,
      'userId': Preference.Pref.getInt('userId').toString(),
    });
  }
  if (image.path.isNotEmpty) {
    request.files.add(
      http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: image.path.split("/").last,
      ),
    );
  }
  var res = await request.send();

  if (res.statusCode == 200) {
    final data = await res.stream.bytesToString();
    var jsoncode = jsonDecode(data);
    if (jsoncode['status'] == true) {
      print(data);
      Preference.Pref.setString("image", jsoncode["data"]["image"] ?? "");
      Preference.Pref.setString("name", jsoncode["data"]["name"] ?? "");
      Preference.Pref.setString("mobile", jsoncode["data"]["phone"] ?? "");
      customSnackbar(context, jsoncode["message"]);
      Navigator.pop(context);
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future addcycletracking(
  DateTime last_period_date,
  String last_period_days,
  String last_long_period_days,
  String currently_pet,
  String predictions,
  String period_notification,
) async {
  try {
    var response = await http
        .post(Uri.parse(baseURL + cycleTracking_url), headers: headers, body: {
      'last_period_date': last_period_date.toIso8601String(),
      'last_period_days': last_period_days,
      'last_long_period_days': last_long_period_days,
      'currently_pet': currently_pet,
      'predictions': predictions,
      'period_notification': period_notification,
      'pet_id': Preference.Pref.getInt('selectedPetId').toString()
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        Preference.Pref.setString('selectedpetcyclestatus', "1");
        mypetApi().then((value) {
          mypetmoellist = value;
        });
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } catch (e) {
    // TODO
    return false;
  }
}

Future getcycletracking(BuildContext context) async {
  final read = context.read<CalenderProvider>();
  read.loadingstate(true);
  try {
    var response = await http.get(
      Uri.parse(
        baseURL +
            get_cycle_url +
            "?pet_id=" +
            Preference.Pref.getInt('selectedPetId').toString(),
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        read.selecteddays.clear();
        read.getCycleData(data["data"]);
        read.loadingstate(false);
        return true;
      } else {
        read.loadingstate(false);
        return false;
      }
    } else {
      read.loadingstate(false);
      return false;
    }
  } catch (e) {
    // TODO
    read.loadingstate(false);
    return false;
  }
}

Future getcycleprediction(BuildContext context) async {
  final read = context.read<Predictions>();
  // read.loadingstate(true);
  try {
    var response = await http.post(
      Uri.parse(baseURL + period_priducation_url),
      body: {
        "pet_id": Preference.Pref.getInt('selectedPetId').toString(),
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        // read.getCycleData(data["data"]);
        // read.loadingstate(false);
        read.lastlong = int.parse(data["data"]["last_period_days"] ?? 0);
        read.iterval = int.parse(data["data"]["last_long_period_days"] ?? "0");
        return data["data"]["next_period_days"] ?? [];
      } else {
        // read.loadingstate(false);
        return null;
      }
    } else {
      // read.loadingstate(false);
      return null;
    }
  } catch (e) {
    // TODO
    // read.loadingstate(false);
    return null;
  }
}

Future addcycle(List<String> date, String period, String symptoms,
    String spotting, String is_add,
    [bool isupdate = false]) async {
  try {
    var body = date
        .map((e) => {
              'date': e,
              'period': period,
              'symptoms': symptoms,
              'spotting': spotting,
              // 'is_add': is_add,
              'pet_id': Preference.Pref.getInt('selectedPetId').toString()
            })
        .toList();
    print(jsonEncode(body));
    var response = await http.post(Uri.parse(baseURL + add_cycle_url),
        headers: headers,
        body: isupdate
            ? {
                'date': date.first,
                'period': period,
                'symptoms': symptoms,
                'spotting': spotting,
                'is_add': is_add,
                'pet_id': Preference.Pref.getInt('selectedPetId').toString()
              }
            : {
                "cycle_period": jsonEncode(body),
                'is_add': is_add,
              }
        //     {
        //   'date': date.join(","),
        //   'period': period,
        //   'symptoms': symptoms,
        //   'spotting': spotting,
        //   'is_add': is_add,
        //   'pet_id': Preference.Pref.getInt('selectedPetId').toString()
        // }
        );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } catch (e) {
    // TODO
    return false;
  }
}

Future getreminderData(
    // BuildContext context,
    ) async {
  try {
    print("object");
    var response = await http.post(
      Uri.parse(baseURL + get_reminder_url),
      body: {"user_id": Preference.Pref.getInt("userId").toString()},
      headers: headers,
    );
    print("qwerqweqweqweqwe");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("====== services is started");
      // flutterLocalNotificationsPlugin.show(
      //   10,
      //   "qqwerqwerwe",
      //   "qwertyuiopuytre daily",
      //   platformChannelSpecifics,
      // );
// List<Daily?>? dailyList = [];
//           List<Daily?>? weekList = [];
//           dailyList = dailyFromJson(jsonEncode(data["daily"]));
//           weekList = dailyFromJson(jsonEncode(data["week"]));

      // DateTime date = DateTime(
      //   2023,
      //   01, 10, 15, 50,
      //   // int.parse(element.atTime!.split(":").first),
      //   // int.parse(element.atTime!.split(":")[1]),
      // );
      // NotificationHelper().scheduleonday(
      //   1,
      //   "qwertyt",
      //   "Your pet medicine time",
      //   date,
      // );

      int i = 0;
      List<Daily?>? dailyList = [];
      List<VaccinationReminder> dewormingList = [];
      List<Daily?>? weekList = [];
      List<Data> dlist = [];

      NotesDatabase.instance.delete();
      dailyList = dailyFromJson(jsonEncode(data["daily"]));
      weekList = dailyFromJson(jsonEncode(data["week"]));
      print(data["deworming"]);
      // dlist.add(Data.fromJson(data["deworming"].first));
      dlist = List<Data>.from(data["deworming"].map((e) => Data.fromJson(e)));
      Preference.Pref.setString("dailyReminder", dailyToJson(dailyList));
      Preference.Pref.setString("weeklyReminder", dailyToJson(weekList));
      print("========");
      dlist.forEach((element) {
        Note note = Note(
          pet_id: element.petId!,
          medicine_name: "Dewarming",
          duration: element.reminder!,
          does: element.reminder!,
          attime: element.atTime!,
          which: "Dewarming",
          nextdate: element.nextdose!,
        );
        NotesDatabase.instance.create(note);
      });
      dailyList!.forEach((e) {
        Note note = Note(
          pet_id: e!.petId!,
          medicine_name: e.medicineName!,
          duration: e.duration!,
          does: e.does!,
          attime: e.atTime!,
          which: "medicine",
          nextdate: e.nextdate!.toIso8601String(),
        );
        NotesDatabase.instance.create(note);
      });
      weekList!.forEach((e) {
        Note note = Note(
          pet_id: e!.petId!,
          medicine_name: e.medicineName!,
          duration: e.duration!,
          does: e.does!,
          attime: e.atTime!,
          nextdate: e.nextdate!.toIso8601String(),
          which: "medicine",
        );
        NotesDatabase.instance.create(note);
      });
      dewormingList =
          vaccinationReminderFromJson(jsonEncode(data["vaccination"]));
      dewormingList.forEach((element) {
        Note note = Note(
          pet_id: element.petId!,
          medicine_name: element.vaccinationId!,
          duration: element.reminder!,
          does: element.dose!,
          attime: element.atTime!,
          nextdate: element.atDate!.toIso8601String(),
          which: "vaccine",
        );
        NotesDatabase.instance.create(note);
      });
      // dailyList?.forEach((element) {
      //   String time = to24Hours(element!.atTime!);
      //   print(time);

      //   DateTime date = DateTime(
      //     element.nextdate!.year,
      //     element.nextdate!.month,
      //     element.nextdate!.day - 1,
      //     int.parse(time.split(":").first),
      //     int.parse(time.split(":")[1]),
      //   );
      //   if (is_In_This_hour(date)) {
      //     flutterLocalNotificationsPlugin.show(
      //       i,
      //       element.medicineName,
      //       "qwertyuiopuytre daily",
      //       platformChannelSpecifics,
      //     );
      //     i++;

      //     //   NotificationHelper().scheduleonday(
      //     //     i,
      //     //     element.medicineName.toString(),
      //     //     "Your pet medicine time",
      //     //     date,
      //     //   );
      //     //   i++;
      //   }
      // });
      // weekList?.forEach((element) {
      //   String time = to24Hours(element!.atTime!);
      //   print(time);
      //   DateTime date = DateTime(
      //     element.nextdate!.year,
      //     element.nextdate!.month,
      //     element.nextdate!.day,
      //     int.parse(time.split(":").first),
      //     int.parse(time.split(":")[1]),
      //   );
      //   if (is_In_This_hour(date)) {
      //     flutterLocalNotificationsPlugin.show(
      //       i,
      //       element.medicineName,
      //       "qwertyuiopuytre week",
      //       platformChannelSpecifics,
      //     );
      //     i++;

      //     //   NotificationHelper().scheduleonday(
      //     //     i,
      //     //     element.medicineName.toString(),
      //     //     "Your pet medicine time",
      //     //     date,
      //     //   );
      //     //   i++;
      //   }
      // });

      // return list;
      // customSnackbar(context, jsoncode["message"]);

    } else {
      return [];
    }
  } catch (e) {
    // TODO
    return [];
  }
}

Future getAllreminderData(
  BuildContext context,
) async {
  try {
    print("object");
    var response = await http.get(
      Uri.parse(baseURL +
          all_reminder_url +
          "?user_id=" +
          Preference.Pref.getInt("userId").toString()),
      // body: {"user_id": Preference.Pref.getInt("userId").toString()},
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      int i = 0;
      List<Daily?>? dailyList = [];
      List<Daily?>? weekList = [];
      List<Data> dlist = [];
      List<VaccinationReminder> dewormingList = [];
      dailyList = dailyFromJson(jsonEncode(data["daily"]));
      weekList = dailyFromJson(jsonEncode(data["week"]));
      dewormingList =
          vaccinationReminderFromJson(jsonEncode(data["vaccination"]));
      dlist = List<Data>.from(data["deworming"].map((e) => Data.fromJson(e)));
      context.read<ReminderService>().dailyreminderList?.addAll(dailyList!);
      context.read<ReminderService>().weeklyreminderList?.addAll(weekList!);
      context.read<ReminderService>().vaccineList.addAll(dewormingList);
      context.read<ReminderService>().dList.addAll(dlist);
      // return list;
      // customSnackbar(context, jsoncode["message"]);

    } else {
      return [];
    }
  } catch (e) {
    // TODO
    return [];
  }
}
