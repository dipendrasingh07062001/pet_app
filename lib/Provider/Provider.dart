import 'package:flutter/material.dart';
import '../Screens/Login.dart';
import '../Screens/Signup.dart';
import '../UTILS/Utils.dart';


class ProviderTutorial extends ChangeNotifier {
    bool isClick= false;



 change(){
  isClick=!isClick;
  notifyListeners();
 }

  NavigateLogin(BuildContext context) {
    Navigate_to(context, Login());
    isClick=true;
    notifyListeners();
  }
  NavigateSinup(BuildContext context) {
    Navigate_to(context, Signup());
    isClick=false;
    notifyListeners();
  }



// // for validation

// ValidationItem _email = ValidationItem(null!, null!);
// ValidationItem _password = ValidationItem(null!, null!);



// ValidationItem get Email => _email;
// ValidationItem get Password => _password;


// bool isValid(){
//  if(_email==null && _password== null){
//   return true;

//  }else{
//   return false;
//  }

// }



// void ValidEmail(value){
//   if(_email.value.isEmpty){

//       _email=ValidationItem(value, "Please enter Email");

//   }else{
//     _email = ValidationItem(value, value);
//   }

//   notifyListeners();
// }



// void ValidPassword(value){
//   if(_password.value.isEmpty){

//       _password=ValidationItem(value, "Please enter Password");

//   }else{
//     _password = ValidationItem(value, value);
//   }

//   notifyListeners();
// }



// void IsLogin(){
//   print("Email : ${Email.value},  Password : ${Password.value}");


// }

}



// class ValidationItem{
//   final String value;
//   final String error;
//   ValidationItem(this.value,this.error);

// }