import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/modules/register/cubit/cubit.dart';
import 'package:whats_app/modules/register/cubit/states.dart';
import 'package:whats_app/shared/style/colors.dart';

import '../../layout/whats_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is SocialCreateUserSuccess) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              print(state.uId);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const WhatsLayout()));
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: HexColor('#001313'),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor('#06141A'),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.green.withOpacity(0.6),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: const Image(
                                image: AssetImage('assets/images/whats.jpg'),
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'WhatsApp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Join Us On WhatsApp',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Chat With Your Friend,It\'s a long fact that reader will be distracted by the readable content of a page when looking at its layout',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor('#06141A'),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  defaultTextFormField(
                                    controller: nameController,
                                    hintText: 'Name',
                                    prefixIcon: Icons.person,
                                    keyboard: TextInputType.name,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Name must not be null';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  defaultTextFormField(
                                    controller: phoneController,
                                    hintText: 'Phone',
                                    prefixIcon: Icons.phone,
                                    keyboard: TextInputType.phone,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Phone must not be null';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  defaultTextFormField(
                                    controller: emailController,
                                    hintText: 'Email',
                                    prefixIcon: Icons.email,
                                    keyboard: TextInputType.emailAddress,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Email must not be null';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      // textInputAction: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.blue,
                                        )),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            RegisterCubit.get(context)
                                                .showPasswordVisibility();
                                          },
                                          icon: Icon(
                                            RegisterCubit.get(context)
                                                .suffixIcon,
                                            color: Colors.white,
                                          ),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Colors.white,
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.only(),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        hintText: 'Password',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      obscureText: RegisterCubit.get(context)
                                          .passwordVisibility,
                                      controller: passwordController,
                                      cursorColor: Colors.grey,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Password must not be null';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {},
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                  /*  defaultTextFormField(
                                  onSubmitted: (){},
                                  controller:phoneController ,
                                  hintText: 'Password',
                                  prefixIcon: Icons.lock,
                                  suffixIcon: Icons.visibility_off,
                                  keyboard: TextInputType.visiblePassword,
                                  validator: (String value){
                                    if(value.isEmpty) {
                                      return 'Password must not be null';
                                    }
                                    return null;
                                  },
                                ), */
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  BuildCondition(
                                    condition: state is! WhatsRegisterLoading,
                                    fallback: (context)=>const Center(child: CircularProgressIndicator(color: defaultColor,)),
                                    builder: (context)=>MaterialButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          RegisterCubit.get(context).userRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'Go',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
