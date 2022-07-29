// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:apidemo/view/homescreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  'DE COMPANY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )),
          SizedBox(
              height: 100,
              width: 100,
              child: Image(
                  image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/004/565/957/original/modern-and-elegant-d-letter-initial-logo-design-free-vector.jpg")))
        ],
      ),
    );
  }
}
