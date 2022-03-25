import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var emailController = TextEditingController();
    return Scaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultTextFormField(
                            textInputAction: TextInputAction.next,
                            controller:nameController ,
                            hintText: 'Name',
                            prefixIcon: Icons.person,
                            keyboard: TextInputType.name,
                            validator: (String value){
                              if(value.isEmpty) {
                                return 'Name must not be null';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                            controller:phoneController ,
                            hintText: 'Phone',
                            prefixIcon: Icons.phone,
                            keyboard: TextInputType.phone,
                            validator: (String value){
                              if(value.isEmpty) {
                                return 'Phone must not be null';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                            controller:emailController ,
                            hintText: 'Email',
                            prefixIcon: Icons.email,
                            keyboard: TextInputType.emailAddress,
                            validator: (String value){
                              if(value.isEmpty) {
                                return 'Email must not be null';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
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
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          MaterialButton(
                            color: Colors.green,
                            onPressed: () {},
                            child: const Text(
                              'Go',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
    );
  }
}
