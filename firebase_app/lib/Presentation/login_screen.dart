import 'package:firebase_app/Infrastructure/db_functions.dart';
import 'package:firebase_app/Model/user_model.dart';
import 'package:firebase_app/Presentation/home_screen.dart';
import 'package:firebase_app/Presentation/registration_screen.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginAFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://png.pngtree.com/background/20210716/original/pngtree-blue-line-abstract-space-gradient-background-picture-image_1360484.jpg',
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _loginAFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/11753/11753627.png',
                    ),
                    height: 90,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (_loginAFormKey.currentState!.validate()) {
                            UserModel u = UserModel(
                              "",
                              "",
                              emailController.text,
                              "userGender",
                              "",
                              passwordController.text,
                            );
                            bool result = await checkLogin(u);
                            debugPrint((result).toString());
                            if (result) {
                              UserModel u = await loadUser('');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ScreenUserHome(u: u),
                                ),
                              );
                            } else {
                              final snackBar = SnackBar(
                                content: Text('Cannot Login'),
                                // action: SnackBarAction(
                                //   label: 'ok',
                                //   onPressed: () {
                                //     Navigator.pop(context);
                                //   },
                                // ),
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an account?',
                        style: TextStyle(color: Colors.indigo),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenRegistration(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add_box_rounded, color: Colors.pink),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
