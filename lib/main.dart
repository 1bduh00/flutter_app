import 'package:digital_bank/pages/home.dart';
import 'package:digital_bank/pages/login.dart';
import 'package:digital_bank/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/': (context) => Home()
      },
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
