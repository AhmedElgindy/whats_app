import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
   required String hintText,
  IconData? prefixIcon,
  IconData? suffixIcon ,
  required TextInputType keyboard,
  bool security = false,
  required Function validator,
  Function? suffixPressed,
}){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration:    InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),

        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        suffixIcon:IconButton(
          onPressed: (){
            suffixPressed!();
          },
          icon: Icon(
            suffixIcon,
            color: Colors.white,
          ),
        ),
        prefixIcon:  Icon(
          prefixIcon,
          color: Colors.white,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
          ),
          borderSide: BorderSide(
              color: Colors.grey
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      obscureText: security,
      controller: controller,
      cursorColor: Colors.grey,
      validator: (value) {
        validator(value);
      },
      keyboardType: keyboard,
    ),
  );
}

void showToast({required String txt, required ToastState state}) {
  Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { SUCCESS, ERROR, WRONG }
late Color color;
Color chooseToastColor(ToastState state) {
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WRONG:
      color = Colors.amber;
      break;
  }
  return color;
}
