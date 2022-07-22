import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/models/message_model.dart';
import 'package:whats_app/models/user_model.dart';
import 'package:whats_app/shared/style/themes.dart';

import '../../shared/style/colors.dart';

UserModel? usermodel;

class ChatContentScreen extends StatelessWidget {
  UserModel userModel;
  ChatContentScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  var MessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      WhatsCubit.get(context).getMessage(reciverId: userModel.uId!);
      return BlocConsumer<WhatsCubit, WhatsStates>(
          builder: (context, state) {
            return Theme(
              data: normalMode,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 5,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: defaultColor.withOpacity(0.5),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  title: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage('${userModel.image}'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${userModel.name}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Active Now",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.video_call_rounded,
                            color: Colors.green)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.green,
                        )),
                  ],
                ),
                body: Column(children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: WhatsCubit.get(context).messages.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var message = WhatsCubit.get(context).messages[index];
                        if (WhatsCubit.get(context).userModel!.uId ==
                            message.senderId) {
                          return buildMyMessage(message);
                        }
                        return buildMessage(message);
                      },
                    ),
                  ),
                ]),
                bottomSheet: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(color: HexColor('#001313')),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                controller: MessageController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type Here",
                                    icon: Icon(
                                      Icons.emoji_emotions_rounded,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.file_present_rounded,
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.message_rounded),
                          color: Colors.white,
                          onPressed: () {
                            WhatsCubit.get(context).sendMessage(
                                reciverId: userModel.uId!,
                                dataTime: DateTime.now().toString(),
                                text: MessageController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {});
    });
  }
}

Widget buildMessage(MessageModel model) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topStart: Radius.circular(10),
              topEnd: Radius.circular(10),
            )),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(model.text!),
      ),
    );

Widget buildMyMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
          color: defaultColor.withOpacity(0.5),
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
          )),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Text(model.text!),
    ));
