import 'package:flutter/material.dart';
import 'package:whats_app/shared/components/constants.dart';
import 'package:whats_app/shared/style/themes.dart';

import '../../shared/style/colors.dart';
import 'bottom_send_navigation.dart';

class ChatContentScreen extends StatelessWidget {
  final int index;
  const ChatContentScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        image: dummyData[index].image, fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dummyData[index].name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          "Active Now",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
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
                icon:
                    const Icon(Icons.video_call_rounded, color: Colors.green)),
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
        body: const Center(child: Text("hello")),
        bottomSheet: BottomSendNavigation(),
      ),
    );
  }
}
