import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';

import '../../shared/style/colors.dart';

// ignore: must_be_immutable
class StatusDetails extends StatelessWidget {
  String text;
  String image;
  String imageStatus;
  String name;
  String dateTime;
  String time;
  StatusDetails(
      {Key? key,
      required this.text,
      required this.image,
      required this.name,
      required this.imageStatus,
      required this.dateTime,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhatsCubit, WhatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: defaultColor.withOpacity(0.5),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          image,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            time,
                            style: const TextStyle(
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
                      children: [
                        Image(
                            image: NetworkImage(
                              imageStatus,
                            ),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity),
                        Container(
                          // alignment: Alignment.center,
                          padding: const EdgeInsets.only(bottom: 50),
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          color: Colors.black26,
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
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
      },
    );
  }
}
