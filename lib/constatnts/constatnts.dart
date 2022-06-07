// bool isValid(String value){
//   bool emailValid;
//  return  emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
//
// }
import 'package:flutter/material.dart';

import '../data_layer/local/cache_helper.dart';
import '../presentation_layer/screens/login_screen.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}


void printFullText(String text){
  final pattern =RegExp('.{1.800}');// 800 is the size of each chunk
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}


void signOut(BuildContext context){
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.pushReplacementNamed(
          context, LoginScreen.routeName);
    }
  });
}



String? token;