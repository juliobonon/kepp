import 'package:flutter/material.dart';
import 'package:kepp/providers/builds_provider.dart';
import 'package:kepp/routegenerator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kepp/services/auth.dart';
import 'package:kepp/services/emailValidator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        ),
        Provider<BuildProvider>(
          create: (_) => BuildProvider(),
        ),
        Provider<Validator>(
          create: (_) => Validator(),
        ),
        StreamProvider(
          create: (context) => context.read<Auth>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kepp',
        theme: ThemeData.dark(),
        // is not restarted.
        initialRoute: '/initialRoute',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
