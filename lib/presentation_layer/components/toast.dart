
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void showToast({required String text,required ToastState state  })=>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );
enum ToastState{SUCCESS,ERROR,WARNING}
Color chooseToastColor(ToastState state){
  switch(state){
    case ToastState.SUCCESS:
      return Colors.green;
    case ToastState.ERROR:
      return Colors.red;
    case ToastState.WARNING:
      return Colors.amber;

  }
}