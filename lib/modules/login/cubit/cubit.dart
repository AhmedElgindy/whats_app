import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInit());
  static LoginCubit get(context)=>BlocProvider.of(context);
  IconData suffixIcon = Icons.visibility_off_outlined;
  var passwordVisibility =true;
  void showPasswordVisibility(){
    passwordVisibility =!passwordVisibility;
    suffixIcon = passwordVisibility?Icons.visibility_off_outlined:Icons.visibility;
    emit(ChangeSecure());
  }

  void userLogin({
  required email,
    required password
}){
    emit(WhatsLoginLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
    emit(WhatsLoginSuccess(value.user!.uid));
    }).catchError((error){
      emit(WhatsLoginError(error.toString()));
    });
  }
}