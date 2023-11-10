import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_exam/views/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
     Navigator.pushReplacementNamed(context, "Login");
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset("assets/s1.jpg",fit: BoxFit.fitWidth),
            ),
            Center(child: CircularProgressIndicator(color: Colors.white,))
          ],
        ),
    );
  }
}
