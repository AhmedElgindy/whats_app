import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/models/user_model.dart';
import 'package:whats_app/modules/chats/chats_screen.dart';
import 'package:whats_app/modules/status/status_screen.dart';
import 'package:whats_app/shared/components/constants.dart';

import '../../modules/profile/profile_screen.dart';

class WhatsCubit extends Cubit<WhatsStates> {
  WhatsCubit() : super(WhatsInit());
  static WhatsCubit get(context) => BlocProvider.of(context);
  //index for changing page state
  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNav());
  }

  List<Widget> screen = const [
    ChatsScreen(),
    StatusScreen(),
    ProfileScreen(),
  ];

  // GetUserData
  UserModel? userModel;
  void getUserData(){
    emit(GetUserDataLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value){
          userModel = UserModel.fromJson(value.data()!);
          emit(GetUserDataSuccess());
    })
        .catchError((error){
          emit(GetUserDataError());
    });
  }
  File? profileImage ;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      emit(SocialProfileImagePickedErrorState());
    }
  }

  // EditProfile
  void uploadProfileImage({
    @required name,
    @required bio,
    @required phone,
  }){
    emit(SocialUpdateProfileLoadingState());
    firebase_storage.FirebaseStorage.instance.ref().child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value){
      value.ref.getDownloadURL()
          .then((value) {
        updateUser(
          name: name,
          bio: bio,
          phone: phone,
          image: value,
        );
      })
          .catchError((error){
        emit(SocialUpdateProfileErrorState());
      }
      );
    })
        .catchError((error){
      emit(SocialUpdateProfileErrorState());
    });
  }

  void updateUser({
    required name,
    required bio,
    required phone,
    String? image,
  }){
    emit(SocialUpdateProfileLoadingState());
    UserModel model = UserModel(
        email: userModel!.email,
        name: name,
        phone: phone,
        uId: userModel!.uId,
        image:image?? userModel!.image,
        bio: bio,
    );
    FirebaseFirestore.instance.collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    })
        .catchError((error){
      emit(SocialUpdateProfileErrorState());
    });
  }

  // Status
  File? statusImage ;
  Future<void> getStatusImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      statusImage = File(pickedFile.path);
      emit(SocialStatusImagePickedSuccessState());
    } else {
      emit(SocialStatusImagePickedErrorState());
    }
  }
  void removePostImage(){
    statusImage =null;
    emit(SocialRemoveStatusImageState());
  }
}
