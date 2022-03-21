
import 'package:flutter/material.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 90),
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            headline3: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        home: const HomePage());
  }
}
