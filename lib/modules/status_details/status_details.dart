import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/style/colors.dart';

class StatusDetails extends StatelessWidget {
  const StatusDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: defaultColor.withOpacity(0.5),
                      ),
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/03/01/94/34/240_F_301943459_hZqG7C4F3nnACx811k2CwS4YfomRT1n1.jpg',
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      Text(
                        'Mohammed Ashraf',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '12:20 PM',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:  [
                    const Image(
                        image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/whatsapp-5d984.appspot.com/o/users%2Fimage_picker5601193744695634156.jpg?alt=media&token=626db624-5231-444d-8384-7ce6b0447efa',
                        ),
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity
                    ),
                    Container(
                     // alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 50),
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      color: Colors.black26,
                      child: const Text(
                        'Hallo World',
                        textAlign:TextAlign.center ,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
