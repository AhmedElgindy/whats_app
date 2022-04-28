import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
