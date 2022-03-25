import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var emailController =TextEditingController();
    var passwordController =TextEditingController();
    return Scaffold(
      backgroundColor: HexColor('#001313'),
      body: SafeArea(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration:  BoxDecoration(
                color: HexColor('#06141A'),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children:  [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)
                      ),
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
                          color: Colors.white
                      ),
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
                children:  const [
                  Text(
                    'Welcome On WhatsApp',
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
                decoration:  BoxDecoration(
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
                        children:  [
                          defaultTextFormField(
                            textInputAction: TextInputAction.next,
                              controller:emailController ,
                              hintText: 'Email',
                              prefixIcon: Icons.phone,
                              keyboard: TextInputType.phone,
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
                            controller:passwordController,
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            security: true,
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
                            onPressed: (){},
                            child: const Text(
                              'Go',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t Have Account?',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>RegisterScreen()
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                  ),
                                ),
                              ),
                            ],
                          )
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