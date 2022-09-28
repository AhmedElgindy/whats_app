import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';
import '../../shared/style/colors.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhatsCubit, WhatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = WhatsCubit.get(context).userModel!.name!;
        bioController.text = WhatsCubit.get(context).userModel!.bio!;
        phoneController.text = WhatsCubit.get(context).userModel!.phone!;
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: defaultColor.withOpacity(0.5),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 55, right: 25),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            child: WhatsCubit.get(context).profileImage == null
                                ? CircleAvatar(
                                    radius: 62,
                                    backgroundImage: NetworkImage(
                                        WhatsCubit.get(context)
                                            .userModel!
                                            .image!),
                                  )
                                : CircleAvatar(
                                    radius: 62,
                                    backgroundImage: FileImage(
                                        WhatsCubit.get(context).profileImage!),
                                  ),
                          ),
                          CircleAvatar(
                            radius: 19,
                            backgroundColor: defaultColor,
                            child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 17,
                                ),
                                onPressed: () {
                                  WhatsCubit.get(context).getProfileImage();
                                }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 20, start: 10, end: 20, bottom: 5),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        controller: nameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Name must not be null';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 20, start: 10, end: 20, bottom: 5),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Bio',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                        controller: bioController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Bio must not be null';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 20, start: 20, end: 30),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Phone',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                        controller: phoneController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Phone must not be null';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    if (WhatsCubit.get(context).profileImage != null &&
                        state is! SocialUpdateProfileLoadingState)
                      Container(
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        padding: EdgeInsetsDirectional.zero,
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              WhatsCubit.get(context).uploadProfileImage(
                                  name: nameController.text,
                                  bio: bioController.text,
                                  phone: phoneController.text);
                            }
                          },
                          child: const Text(
                            'Update and Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    if (WhatsCubit.get(context).profileImage == null &&
                        state is! SocialUpdateProfileLoadingState)
                      Container(
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        padding: EdgeInsetsDirectional.zero,
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              WhatsCubit.get(context).updateUser(
                                  name: nameController.text,
                                  bio: bioController.text,
                                  phone: phoneController.text);
                            }
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    if (state is SocialUpdateProfileLoadingState)
                      const Center(
                          child: CircularProgressIndicator(
                        color: defaultColor,
                      )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
