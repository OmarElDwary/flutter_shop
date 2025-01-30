import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_shop/views/screens/HomeScreen.dart';
import 'package:ecommerce_shop/views/screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passHidden = true;
  bool confirmPassHidden = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            Text('Techno Shop', style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale == Locale('en')) {
                  context.setLocale(Locale('ar'));
                } else {
                  context.setLocale(Locale('en'));
                }
              },
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                context.tr('register'),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                validator: (value) {
                  // check for the 1st index of the string
                  if (value == null || value[0] != value[0].toUpperCase()) {
                    return context.tr('nameError');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: context.tr('name'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff50b3c8), width: 1.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff001F54)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  // check if it contains an @ or not
                  if (value == null || !value.contains("@")) {
                    return context.tr('emailError');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: context.tr('email'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff50b3c8), width: 1.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff001F54)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                // show and hide password
                obscureText: passHidden,
                validator: (value) {
                  // check that the password have a min of 6 characters
                  if (value == null || value.length < 6) {
                    return context.tr('passwordError');
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: context.tr('password'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff50b3c8), width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff001F54)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          togglePassword();
                        },
                        icon: passHidden
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: confirmPasswordController,
                obscureText: confirmPassHidden,
                validator: (value) {
                  // validate it is the same as the text of the password controller
                  if (value == null || value != passwordController.text) {
                    return context.tr('confirmPasswordError');
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: context.tr('confirmPassword'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff50b3c8), width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff001F54)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          toggleConfirmPassword();
                        },
                        icon: confirmPassHidden
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    registerDialog();
                  }
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (credential.user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xff50B3C8),
                    foregroundColor: Color(0xffF1F0F1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: Text(context.tr('register'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already registered? '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff50B3C8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Add dialog
  Future<void> registerDialog() async {
    return showModal<void>(
        configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(seconds: 2),
            reverseTransitionDuration: Duration(milliseconds: 3500)),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Text(context.tr('accountCreated')),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Future.delayed(Duration(milliseconds: 800), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                      });
                    },
                    child: Text(context.tr('goToHome')))
              ]);
        });
  }

  togglePassword() {
    passHidden = !passHidden;
    setState(() {});
  }

  toggleConfirmPassword() {
    confirmPassHidden = !confirmPassHidden;
    setState(() {});
  }
}
