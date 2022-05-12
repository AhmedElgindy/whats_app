import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/modules/create_status/create_status.dart';
import 'package:whats_app/shared/style/colors.dart';
import 'package:whats_app/shared/style/themes.dart';

class WhatsLayout extends StatelessWidget {
  const WhatsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhatsCubit, WhatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Theme(
          data: normalMode,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Image(
                    image: AssetImage('assets/images/whats.jpg'),
                  ),
                ),
              ),
              title: const Text(
                'whats app',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      iconSize: 30,
                      icon: const Icon(
                        Icons.search_rounded,
                      )),
                ),
              ],
            ),
            body: WhatsCubit.get(context)
                .screen[WhatsCubit.get(context).currentIndex],
            bottomNavigationBar: CircleNavBar(
              color: HexColor('#06141A'),
              onChanged: (index) {
                WhatsCubit.get(context).changeBottomNav(index);
              },
              initIndex: WhatsCubit.get(context).currentIndex,
              activeIcons: const [
                Icon(Icons.chat, color: Colors.green),
                Icon(Icons.add_circle_outline, color: Colors.green),
                Icon(Icons.person, color: Colors.green),
                //  Icon(Icons.camera, color: Colors.green),
              ],
              circleWidth: 65,
              height: 70,
              shadowColor: Colors.green,
              elevation: 3,
              inactiveIcons: const [
                Text(
                  'Chats',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Status',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'My',
                  style: TextStyle(color: Colors.grey),
                ),
                /*  Text(
                  'Camera',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),*/
              ],
            ),
            floatingActionButton:WhatsCubit.get(context).currentIndex ==1?
            FloatingActionButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>const CreateStatus(),
                    ),
                  );
                },
              backgroundColor: defaultColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
                :null,
          ),
        );
      },
    );
  }
}
