import 'package:digital_bank/constant/constants.dart';
import 'package:digital_bank/widgets/inputField.dart';
import 'package:digital_bank/widgets/textButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordVisible = false;
  bool _agreedToPrivacy = false;
  String fname = '';
  String lname = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lets's create your account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              inputForm()
            ],
          ),
        ),
      ),
    );
  }

  Form inputForm() {
    return Form(
      child: Column(
        children: [
          fullName(),
          const SizedBox(height: 25),
          InputField("E-mail", const Icon(Icons.email_outlined), (value) {
            setState(() {
              email = value;
            });
          }),
          const SizedBox(height: 25),
          InputField("Phone", const Icon(Icons.phone), (value) {
            setState(() {
              password = value;
            });
          }),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                password = value;
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
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    // Toggle the visibility of the password
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: _agreedToPrivacy,
                onChanged: (value) {
                  setState(() {
                    _agreedToPrivacy = value!;
                  });
                },
              ),
              const Text(
                'I agree to the privacy policy',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButton("Submit", 20, primaryColor, () {
            print("yes");
          }),
        ],
      ),
    );
  }

  Row fullName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InputField("First name", const Icon(Icons.person), (value) {
            setState(() {
              fname = value;
            });
          }),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InputField("Last name", const Icon(Icons.person), (value) {
            setState(() {
              lname = value;
            });
          }),
        ),
      ],
    );
  }
}
