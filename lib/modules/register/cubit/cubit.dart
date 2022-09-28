import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/modules/register/cubit/states.dart';

import '../../../models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInit());
  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData suffixIcon = Icons.visibility_off_outlined;
  var passwordVisibility = true;
  void showPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    suffixIcon =
        passwordVisibility ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ChangeSecure());
  }

  void userRegister({
    @required name,
    @required email,
    @required password,
    @required phone,
  }) {
    emit(WhatsRegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        name: name,
        email: email,
        uId: value.user!.uid,
        phone: phone,
      );
    }).catchError((error) {
      emit(WhatsRegisterError());
      print(error.toString());
    });
  }

  void createUser({
    @required name,
    @required email,
    @required uId,
    @required phone,
  }) {
    UserModel model = UserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId,
        image:
            'https://t3.ftcdn.net/jpg/03/01/94/34/240_F_301943459_hZqG7C4F3nnACx811k2CwS4YfomRT1n1.jpg',
        bio: 'Write Your Bio...');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccess(uId));
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserError());
    });
  }
}
