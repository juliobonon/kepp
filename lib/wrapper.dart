import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kepp/pages/login.dart';
import 'package:kepp/routeManager.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    print(firebaseUser);
    if (firebaseUser != null) {
      return RouteManager();
    } else {
      return Login();
    }
  }
}
