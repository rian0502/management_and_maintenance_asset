import 'package:flutter/material.dart';
import 'package:gudang/screens/login_screen.dart';
import 'package:gudang/thema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemaMaBukitAsam.light(),
      home: const LoginPage(),
    );
  }
}

