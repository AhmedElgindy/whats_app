import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/modules/chats/chats_screen.dart';
import 'package:whats_app/modules/personal/personal_screen.dart';
import 'package:whats_app/modules/status/status_screen.dart';

class WhatsCubit extends Cubit<WhatsStates>{
  WhatsCubit() : super(WhatsInit());
  static WhatsCubit get(context) =>BlocProvider.of(context);
  int currentIndex =0;
  void changeBottomNav(int index){
    currentIndex = index;
    emit(ChangeBottomNav());
  }
  List<Widget>screen =const [
    ChatsScreen(),
    StatusScreen(),
    PersonalScreen(),
  ];
}
