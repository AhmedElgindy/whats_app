import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/style/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: defaultColor.withOpacity(0.5),
            ),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
