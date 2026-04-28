// ignore_for_file: deprecated_member_use, unused_import, unused_local_variable, use_build_context_synchronously, prefer_interpolation_to_compose_strings
//simple calculator
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:etrain/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signupage extends StatefulWidget {
  const Signupage({super.key});

  @override
  State<Signupage> createState() => _SignupageState();
}

class _SignupageState extends State<Signupage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 5),
                  child: Image.asset(
                    "assets/Instagram Logo.png",
                    width: 182,
                    height: 49,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                      r"^[^\s@]+@[^\s@]+\.[^\s@]+$",
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    List<String> missingRequirements = [];

                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      missingRequirements.add('one uppercase letter');
                    }

                    if (!value.contains(RegExp(r'[a-z]'))) {
                      missingRequirements.add('one lowercase letter');
                    }

                    if (!value.contains(RegExp(r'[!@#$&\-_+*]'))) {
                      missingRequirements.add('one special character');
                    }

                    if (missingRequirements.isNotEmpty) {
                      return 'Must include: ' + missingRequirements.join(', ');
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Homepage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          // print('The password provided is too weak.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'The password provided is too weak.',
                            btnOkOnPress: () {},
                          ).show();
                        } else if (e.code == 'email-already-in-use') {
                          //print('The account already exists for that email.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'The account already exists for that email.',
                            btnOkOnPress: () {},
                          ).show();
                        }
                      } catch (e) {
                        // print(e);
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: e.toString(),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      }
                    } else {
                      print("Form is not valid");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(400, 50),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Spacer(),
                Divider(thickness: 1, color: Colors.grey),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text("Instagram от Facebook"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
