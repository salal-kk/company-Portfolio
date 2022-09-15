import 'package:apidemo/service/provider.dart';
import 'package:provider/provider.dart';
import 'package:apidemo/view/splashscreen.dart';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: providers,
  child:const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
    
  }
}