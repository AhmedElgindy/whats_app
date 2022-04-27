import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/shared/style/themes.dart';

import '../../shared/components/constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: normalMode,
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const Divider(
                  height: 15,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/images/talk.jpg'),
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dummyData[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          dummyData[index].time,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ]),
                  subtitle: Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      dummyData[index].message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
