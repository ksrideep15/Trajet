import 'package:flutter/material.dart';
import 'package:trajet/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Homepage(isLoggedIn: true),
        theme: ThemeData(
            //scaffoldBackgroundColor: Colors.transparent //transparent background
            ));
  }
}
