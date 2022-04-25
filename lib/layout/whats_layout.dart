import 'package:flutter/material.dart';

class Whats_App extends StatefulWidget {
  @override
  State<Whats_App> createState() => _Whats_AppState();
}

class _Whats_AppState extends State<Whats_App> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: iconlist[0],
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_rounded,
                ))
          ],
          title: Text("whats app"),
          bottom: TabBar(tabs: [
            Text('CHATS'),
            Text('STATUS'),
            Text('CALLS LOG'),
          ]),
        ),
      ),
    );
  }

  List<Icon> iconlist = [
    Icon(Icons.chat_rounded),
    Icon(Icons.camera_alt_rounded),
    Icon(Icons.add_card_rounded),
  ];
}
