import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/views/favourite.dart';
import 'package:flutter_exam/views/homepage.dart';
import 'package:flutter_exam/views/login.dart';
import 'package:flutter_exam/views/second_page.dart';
import 'package:flutter_exam/views/splash_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool istheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User_app",
      theme: istheme
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Splashscreen(),
        "Login": (context) => Login(),
        "Homepage": (context) => Homepage(),
        "Secondpage": (context) => Secondpage(),
        "Favourite":(context) => Favourite(),
      },
    );
  }
}
