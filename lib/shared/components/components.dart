import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
   required String hintText,
  IconData? prefixIcon,
  IconData? suffixIcon ,
  required TextInputType keyboard,
  bool security = false,
  Function? onchange,
  required Function validator,
  Function? suffixPressed,
  Function? onTap,
  TextInputAction? textInputAction,
  Function? onSubmitted,
}){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      textInputAction: textInputAction,
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
      onChanged: (value){
        onchange!(value);
      },
      onFieldSubmitted: (String? value){
        onSubmitted!(value);
      },
      keyboardType: keyboard,
      onTap: () {
        onTap!();
      },
    ),
  );
}