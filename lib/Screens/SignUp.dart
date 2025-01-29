import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_shop/Screens/HomeScreen.dart';
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
        title: Text('Techno Shop', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {
            if (context.locale == Locale('en')) {
              context.setLocale(Locale('ar'));
            } else {
              context.setLocale(Locale('en'));
            }
          }, icon: Icon(Icons.language, color: Colors.white,))
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
                },
                decoration: InputDecoration(labelText: context.tr('name')),
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
                },
                decoration: InputDecoration(labelText: context.tr('email')),
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
                },
                decoration: InputDecoration(
                    labelText: context.tr('password'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          togglePassword();
                        }, icon: passHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off))),
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
                },
                decoration: InputDecoration(
                    labelText: context.tr('confirmPassword'),
                    suffixIcon: IconButton(
                        onPressed: () {toggleConfirmPassword();}, icon: confirmPassHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerDialog();
                  }
                },
                child: Text(context.tr('register')))
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
          reverseTransitionDuration: Duration(milliseconds: 3500)
        ),
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
                                builder: (context) => const MyHomePage())
                        );
                      });
                    },
                    child: Text(context.tr('goToHome')))
              ]
            );
        });
  }
  togglePassword() {
    passHidden = !passHidden;
    setState(() {

    });
  }
  toggleConfirmPassword() {
    confirmPassHidden = !confirmPassHidden;
    setState(() {

    });
  }
}
