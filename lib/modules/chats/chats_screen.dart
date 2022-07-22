import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/models/user_model.dart';
import 'package:whats_app/shared/style/themes.dart';
import 'chat_content_screen.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhatsCubit, WhatsStates>(
        builder: ((context, state) {
          return Theme(
              data: normalMode,
              child: ListView.builder(
                  itemCount: WhatsCubit.get(context).users.length,
                  itemBuilder: (BuildContext context, int index) =>
                      chatItem(context, WhatsCubit.get(context).users[index])));
        }),
        listener: (context, state) {});
  }
}

Widget chatItem(context, UserModel model) {
  return Column(
    children: [
      const Divider(
        height: 15,
      ),
      ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatContentScreen(
                      userModel: model,
                    ))),
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage('${model.image}'),
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '${model.name}',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ]),
        subtitle: Container(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '${model.name}',
            style: TextStyle(color: Colors.grey[400]),
          ),
        ),
      )
    ],
  );
}
