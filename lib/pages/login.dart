import 'package:digital_bank/constant/constants.dart';
import 'package:digital_bank/services/authApi.dart';
import 'package:digital_bank/widgets/inputField.dart';
import 'package:flutter/material.dart';

import '../widgets/textButton.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false; // Track whether the password is visible or not
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  bool validAuth = true;

  bool checkEmail() {
    return _email.length > 10 ? true : false;
  }

  bool checkPassword() {
    return _password.length >= 8 ? true : false;
  }

  void _submitForm() async {
    if (checkEmail() && checkPassword()) {
      bool resp = await AuthApi.login(_email, _password);

      if (resp) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        setState(() {
          validAuth = false;
        });

        await Future.delayed(const Duration(seconds: 4));
        setState(() {
          validAuth = true;
        });
      }
    } else {
      print("incorrect");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 120, left: 24, right: 24, bottom: 24),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Back ,",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Discover limitess choices and unmatched covenience",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputField("E-mail", const Icon(Icons.email_outlined),
                          (value) {
                        setState(() {
                          _email = value;
                        });
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(Icons.key),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // Toggle the visibility of the password
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Navigate to the forgot password page
                            // You can use Navigator.push() to navigate to the forgot password page
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomTextButton("Submit", 19, primaryColor, () {
                        _submitForm();
                      }),
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Visibility(
                visible:
                    !validAuth, // Replace isValid with your valid inputs variable
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Incorrect credentials!",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the signup page
                      // You can use Navigator.push() to navigate to the signup page
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(221, 49, 93, 236),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
