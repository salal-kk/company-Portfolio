// import 'package:apidemo/model/datamodel.dart';
// import 'package:flutter/material.dart';

// import 'controller/apicall.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

// late Future<List> fetchData;
// @override
//   void initState() {
//    fetchData=fetchDataFromApi();
//   //  fetchData.whenComplete(() => fetchData.then((value) => print(value.toString())));
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//      body: FutureBuilder<List>(
//       future: fetchData,
//   builder: (ctx, snapshot) {
   
       
//     if(snapshot.hasData){
// return  Column(
//   children: [
//         Center(
    
//           child: Text(snapshot.data![0].name),
    
//         ),
        
//   ],
// );
//     }
//     else{
//      return Text("hjh");
//     }
    
//   },)

     // ignore_for_file: prefer_const_constructors
     
//     );
//   }
// }
import 'package:apidemo/view/splashscreen.dart';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
    );
    
  }
}