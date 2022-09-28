import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/shared/bloc_observer.dart';
import 'package:whats_app/shared/components/constants.dart';
import 'package:whats_app/shared/network/local/cache_helper.dart';
import 'package:whats_app/shared/style/themes.dart';

import 'layout/whats_layout.dart';
import 'modules/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  uId = CacheHelper.getData(key: 'uId');
  if (uId == '') {
    widget = const LoginScreen();
  } else {
    widget = const WhatsLayout();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  // ignore: use_key_in_widget_constructors
  const MyApp({
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WhatsCubit()
        ..getUserData()
        ..getStatus()
        ..getUsers(),
      child: BlocConsumer<WhatsCubit, WhatsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WhatsApp',
            theme: normalMode,
            home: startWidget,
          );
        },
      ),
    );
  }
}
