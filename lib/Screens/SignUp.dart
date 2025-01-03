import 'package:animations/animations.dart';
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Register',
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('First Letter should be capital'),
                    duration: Duration(seconds: 2),
                  ));
                  return 'First Letter should be capital';
                }
              },
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              validator: (value) {
                // check if it contains an @ or not
                if (value == null || !value.contains("@")) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter a valid email'),
                    duration: Duration(seconds: 2),
                  ));
                  return 'Please enter a valid email';
                }
              },
              decoration: InputDecoration(labelText: 'Email'),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Password must be more than 6 characters'),
                    duration: Duration(seconds: 2),
                  ));
                  return 'Password must be more than 6 characters';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Password',
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Passwords doesnt match'),
                    duration: Duration(seconds: 2),
                  ));
                  return 'Passwords doesnt match';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Confirm your password',
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
              child: Text('Register'))
        ],
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
              content: Text('Account created successfully'),
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
                    child: Text('Go to homepage'))
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
