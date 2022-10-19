//// login Api
///
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/Models/blogModel.dart';
import 'package:pet_app/Api/Models/getBreedModel.dart';
import 'package:pet_app/Api/Models/getDewormingModel.dart';
import 'package:pet_app/Api/Models/v_model.dart';
import 'package:pet_app/Api/Models/vaccinationModel.dart';
import 'ApiBaseUrl.dart';
import 'Models/My_pet_model.dart';
import 'Models/ServiceListModel.dart';
import 'Prefrence.dart';

String? loginmsg;

Future LoginApi(
  String email,
  password,
) async {
  var response = await http.post(Uri.parse(baseURL + login), body: {
    'email': email,
    'password': password,
  });

  if (response.statusCode == 200) {
    var value = jsonDecode(response.body);
    print("data" + value.toString());

    if (value["status"] == true) {
      print(value["message"]);
      print(response.body);

      Preference.Pref.setString('image', value['data']['image'].toString());
      Preference.Pref.setInt('id', value['data']['id']);
      Preference.Pref.setString('email', value['data']['email'].toString());
      Preference.Pref.setString('name', value['data']['name'].toString());
      Preference.Pref.setString('status', value['data']['status'].toString());
      Preference.Pref.setBool("isFirstTimeUser", false);

      final Userid = Preference.Pref.getInt('id').toString();
      print("user id ====$Userid");
      final userName = Preference.Pref.getString('name').toString();
      print("user id ====$userName");
      final userImage = Preference.Pref.getString('image');
      final Email = Preference.Pref.getString('email');
      print("Image ==== " + value['data']['image']);
      print('User Id : ' + Userid.toString());

      return value;
    } else {
      loginmsg = value['message'];
      return Future.error(value["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}

///Signup Api

String? Sinupmsg;
String? signupEmail;

Future Sinup(String email, password, confirmPassword) async {
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
      Preference.Pref.setString('image', data['data']['image'].toString());
      Preference.Pref.setInt('id', data['data']['id']);
      Preference.Pref.setString('email', data['data']['email'].toString());
      Preference.Pref.setString('name', data['data']['name'].toString());
      Preference.Pref.setString('status', data['data']['status'].toString());

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
Future ForgotPasswordApi(String email) async {
  var response = await http
      .post(Uri.parse(baseURL + forgotPasswordSendOtp), body: {'email': email});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"]);
      print(response.body);

      Preference.Pref.setString('email', email.toString()).toString();

      resendotpemail = Preference.Pref.getString('email').toString();

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

//// forgot password otp verify api
///
bool isLoadingforgotOtp = false;

String? forgotpassotpmsg;
Future ForgotPass_OTP_VERIFY(String otp) async {
  final userEmail = Preference.Pref.getString('eamil').toString();
  var response = await http.post(Uri.parse(baseURL + forgotVerifyOtp),
      body: {'email': resendotpemail, 'otp': otp});
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

Future ChangePasswordApi(String oldpassword, String newPassword) async {
  final userId = Preference.Pref.getInt('id').toString();

  var response = await http.post(Uri.parse(baseURL + changePassword), body: {
    'user_id': userId.toString(),
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

////  Dashbord get service  list api
///

Future servicelistApi([String search = ""]) async {
  String qwe = "?key$search";
  ServiceModel result = ServiceModel();
  var response = await http
      .get(Uri.parse(baseURL + getService + (search == "" ? "" : qwe)));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status']) {
      result = ServiceModel.fromjson(data);
      print(result);
      return result;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// get my pet list api
///

var petid;
Future mypetApi() async {
  MyPetModel result = MyPetModel();
  var response = await http.get(Uri.parse(baseURL + getMyPet));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status']) {
      result = MyPetModel.fromjson(data);
      print(result);
      Preference.Pref.setString('id', '2');
      petid = Preference.Pref.getString('id').toString();
      return result;
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
  var response =
      await http.post(Uri.parse(baseURL + deletepet), body: {'pet_id': id});
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

Future getBreedApi() async {
  var response = await http.get(Uri.parse(baseURL + getBreedPet));
  var jsonRes;
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    jsonRes = data['data'];
    if (data['status'] == true) {
      List list = jsonRes;
      breedlist.addAll(getBreedModelFromJson(jsonEncode(list)));
      // breedlist.addAll(list.map((e) => GetBreedModel.fromJson(e)).toList());
      print(breedlist.toString());

      return data;
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
Future addPetApi(String type, String name, String parentname, String breed,
    String gender, String weight, String dob, File image, File documnt) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + addpet),
  );

  request.files.add(
    http.MultipartFile(
      'image',
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: image.path.split("/").last,
    ),
  );

  request.files.add(
    http.MultipartFile(
      'upload_document',
      documnt.readAsBytes().asStream(),
      documnt.lengthSync(),
      filename: documnt.path.split("/").last,
    ),
  );

  request.fields.addAll({
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
///

String? editpetmsg;
Future editPetApi(
  String type,
  String name,
  String parentname,
  String breed,
  String gender,
  String weight,
  String dob,
  File image,
  File documnt,
  String editimage,
  String editdoc,
) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + editPet),
  );

  request.files.add(
    http.MultipartFile(
      'image',
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: image.path.split("/").last,
    ),
  );

  request.files.add(
    http.MultipartFile(
      'upload_document',
      documnt.readAsBytes().asStream(),
      documnt.lengthSync(),
      filename: documnt.path.split("/").last,
    ),
  );

  request.fields.addAll({
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

    if (jsoncode['status'] == true) {
      print(data);
      editpetmsg = jsoncode['message'].toString();
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

  var response = await http.get(Uri.parse(baseURL + getBlog));
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

//// get Vccination Api

Future getVaccinationListApi() async {
  VaccinationMaodel result = VaccinationMaodel();

  var response = await http.get(Uri.parse(baseURL + getVaccinationList));
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
}

//// delete my pet api

String? deleteVaccinationmsg;
Future deleteVaccintionApi(String vaccinationId) async {
  var response = await http.post(Uri.parse(baseURL + deleteVaccination),
      body: {'vaccination_id': vaccinationId});
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
  var response = await http.get(Uri.parse(baseURL + getVacination));
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

//// add pet Api
String? addVaccinationmsg;
Future addVaccinationApi(
  String vaccinationName,
  String vaccinationStatus,
  String vaccinationdate,
  File vaccinationCertificate,
  String reminder,
  String attime,
  String atdate,
) async {
  ///MultiPart request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + addVaccination),
  );

  request.files.add(
    http.MultipartFile(
      'vaccination_certificatee',
      vaccinationCertificate.readAsBytes().asStream(),
      vaccinationCertificate.lengthSync(),
      filename: vaccinationCertificate.path.split("/").last,
    ),
  );

  request.fields.addAll({
    'vaccination_id': vaccinationName,
    'vaccination_status': vaccinationStatus,
    'vaccination_date': vaccinationdate,
    'reminder': reminder,
    'at_time': attime,
    'at_date': atdate,
  });
  print(request.toString());
  var res = await request.send();
  print(res.toString());

  if (res.statusCode == 200) {
    var data = await res.stream.bytesToString();
    var jsoncode = jsonDecode(data);

    if (jsoncode['status'] == true) {
      print(data);
      addVaccinationmsg = jsoncode['message'].toString();
      return jsoncode;
    } else {
      return Future.error(jsoncode['message']);
    }
  } else {
    return Future.error('Server error');
  }
}

//// edit Vaccination Api
///
String? editvaccinationmsg;
Future editVaccinationApi(
  String vaccinationName,
  String vaccinationStatus,
  String vaccinationdate,
  File vaccinationCertificate,
  String tringVaccinationCertificate,
  String reminder,
  String attime,
  String atdate,
) async {
  ///MultiPart request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(baseURL + addVaccination),
  );

  request.files.add(
    http.MultipartFile(
      'vaccination_certificatee',
      vaccinationCertificate.readAsBytes().asStream(),
      vaccinationCertificate.lengthSync(),
      filename: vaccinationCertificate.path.split("/").last,
    ),
  );

  request.fields.addAll({
    'vaccination_id': vaccinationName,
    'vaccination_status': vaccinationStatus,
    'vaccination_date': vaccinationdate,
    'reminder': reminder,
    'at_time': attime,
    'at_date': atdate,
  });
  print(request.toString());
  var res = await request.send();
  print(res.toString());

  if (res.statusCode == 200) {
    var data = await res.stream.bytesToString();
    var jsoncode = jsonDecode(data);

    if (jsoncode['status'] == true) {
      print(data);
      editvaccinationmsg = jsoncode['message'].toString();
      return jsoncode;
    } else {
      return Future.error(jsoncode['message']);
    }
  } else {
    return Future.error('Server error');
  }
}
// get Deworming Api

Future getDewormingListApi(String petid) async {
  GetDewomingModel result = GetDewomingModel();
  var response = await http.get(Uri.parse(baseURL + getDewormingList));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == true) {
      result = GetDewomingModel.fromjson(data);
      print(result);
      return result;
    } else {
      return Future.error(data['message']);
    }
  } else {
    return Future.error('Server error');
  }
}
