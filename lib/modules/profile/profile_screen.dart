import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/modules/edit_profile/edit_profile_screen.dart';

import '../../shared/style/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhatsCubit, WhatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: state is! GetUserDataLoading,
          builder: (context) => Column(
            children: [
<<<<<<< HEAD
              const Align(
=======
              Align(
>>>>>>> master
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 62,
<<<<<<< HEAD
                    backgroundImage: AssetImage('assets/images/talk2.jpg'),
=======
                    backgroundImage: NetworkImage(
                        '${WhatsCubit.get(context).userModel!.image}'),
>>>>>>> master
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        WhatsCubit.get(context).userModel!.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 56, bottom: 20, top: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.green.withOpacity(0.1),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        WhatsCubit.get(context).userModel!.bio!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 56, bottom: 20, top: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.green.withOpacity(0.1),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        WhatsCubit.get(context).userModel!.phone!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
<<<<<<< HEAD
              const Spacer(),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                          color: Colors.green.withOpacity(0.2),
                        ))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ));
                        },
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
=======
>>>>>>> master
            ],
          ),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
            backgroundColor: defaultColor,
          )),
        );
      },
    );
  }
}
