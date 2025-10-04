import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Toasts {
  static getErrorToast({
    required String text,
    bool islong = false,
  }) async {
    await Fluttertoast.showToast(
      msg: text,
      toastLength: islong == true ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: islong == true ? 10 : 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize:  16.0,
    );
  }

  static getSuccessToast({
    required String text,
  }) async {
    await Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


  
  static getWarningToast({
    required String text,
  }) async {
    await Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}