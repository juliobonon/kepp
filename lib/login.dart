import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kepp/services/auth.dart';
import 'package:kepp/components/input.dart';
import 'package:kepp/services/emailValidator.dart';
import 'package:kepp/components/keppButton.dart';

class Login extends StatefulWidget {
  Login({this.auth, this.onSignedIn, this.validator});

  final BaseAuth auth;
  final VoidCallback onSignedIn;
  final Validator validator;

  @override
  _LoginState createState() => _LoginState();
}

enum FormType { login, register }

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _user = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();

  FormType _formType = FormType.login;

  void validateAndSubmit() async {
    if (validateForm()) {
      if (_formType == FormType.login) {
        try {
          User userId = await widget.auth
              .signInWithEmailAndPassword(_email.text, _password.text);
          print("Signed in: " + userId.uid);
          widget.onSignedIn();
        } catch (e) {
          print(e);
        }
      } else {
        try {
          User userId = await widget.auth
              .createUserWithEmailandPassword(_email.text, _password.text);
          print('Signed in: ' + userId.uid);
          widget.onSignedIn();
        } catch (e) {
          print(e);
        }
      }
    }
  }

  bool validateForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_formType == FormType.login) {
      return loginForm(widget.validator);
    } else {
      return registerForm(widget.validator);
    }
  }

  Widget loginForm(Validator validator) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3743),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: -80,
                      child: Image.asset(
                        'imgs/garra.png',
                        width: 190,
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        'imgs/logo.png',
                        width: 290,
                      ),
                    ),
                  ],
                ),
                InputBox(
                  name: "Email",
                  obscureText: false,
                  controller: _email,
                  validator: validator.validateEmail,
                ),
                InputBox(
                  name: "Password",
                  obscureText: true,
                  controller: _password,
                  validator: validator.validatePassword,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KeppButton(
                      name: "LOGIN",
                      function: validateAndSubmit,
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Or",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    SizedBox(width: 25),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.red, fontSize: 24),
                      ),
                      onPressed: () {
                        setState(() {
                          _formType = FormType.register;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerForm(Validator validator) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3743),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "REGISTER",
                  style: TextStyle(color: Color(0xFFef492f), fontSize: 24),
                ),
                InputBox(
                  name: "User",
                  obscureText: false,
                  controller: _user,
                  validator: validator.validatePassword,
                ),
                InputBox(
                  name: "Email",
                  obscureText: false,
                  controller: _email,
                  validator: validator.validateEmail,
                ),
                InputBox(
                  name: "Password",
                  obscureText: false,
                  controller: _password,
                  validator: validator.validatePassword,
                ),
                InputBox(
                  name: "Repeat Password",
                  obscureText: false,
                  controller: _repeatPassword,
                  validator: validator.validatePassword,
                ),
                SizedBox(height: 20),
                KeppButton(
                  name: "SIGN UP",
                  function: validateAndSubmit,
                ),
                TextButton(
                    child: Text(
                      "Already have an account? Click here",
                      style: TextStyle(color: Color(0xFF556678)),
                    ),
                    onPressed: () {
                      setState(() {
                        _formType = FormType.login;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
