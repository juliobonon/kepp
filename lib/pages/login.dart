import 'package:flutter/material.dart';
import 'package:kepp/components/alertDialog.dart';
import 'package:kepp/services/auth.dart';
import 'package:kepp/components/input.dart';
import 'package:kepp/services/emailValidator.dart';
import 'package:kepp/components/keppButton.dart';
import 'package:provider/provider.dart';

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
          String status = await context
              .read<Auth>()
              .signInWithEmailAndPassword(_email.text, _password.text);
          if (status != 'Logado') {
            showAlertDialog(context, status);
          }
        } catch (e) {
          showAlertDialog(context, e);
        }
      } else {
        try {
          String status = await context
              .read<Auth>()
              .createUserWithEmailandPassword(
                  _user.text, _email.text, _password.text);
          print('Status: ' + status);
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
                  hintText: 'test@email.com',
                  obscureText: false,
                  controller: _email,
                ),
                InputBox(
                  name: "Password",
                  hintText: '********',
                  obscureText: true,
                  controller: _password,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KeppButton(
                      name: "LOGIN",
                      onpressed: validateAndSubmit,
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
                        "Sign up",
                        style: TextStyle(color: Colors.red, fontSize: 24),
                      ),
                      onPressed: () {
                        setState(() {
                          _formType = FormType.register;
                        });
                      },
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    "Click here to continue without an account",
                    style: TextStyle(color: Color(0xFF556678)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/anon');
                  },
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
                    hintText: "John12",
                    obscureText: false,
                    controller: _user,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "User não pode ser vázio";
                      }
                    }),
                InputBox(
                    name: "Email",
                    hintText: 'test@email.com',
                    obscureText: false,
                    controller: _email,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email não pode ser vázio";
                      }
                    }),
                InputBox(
                    name: "Password",
                    hintText: '******',
                    obscureText: false,
                    controller: _password,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password não pode ser vázio";
                      }
                    }),
                InputBox(
                    name: "Repeat Password",
                    hintText: '******',
                    obscureText: false,
                    controller: _repeatPassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Repeat Password não pode ser vázio";
                      }
                    }),
                SizedBox(height: 20),
                KeppButton(
                  name: "SIGN UP",
                  onpressed: validateAndSubmit,
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
