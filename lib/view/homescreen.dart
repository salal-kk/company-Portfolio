// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:apidemo/model/datamodel.dart';
import 'package:apidemo/view/profile.dart';
import 'package:flutter/material.dart';

import '../controller/apicall.dart';
//import 'controller/apicall.dart';

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
//         // Try runn

class MyHomePage extends StatefulWidget {
 // const MyHomePage({Key? key, required this.title}) : super(key: key);
const MyHomePage({Key? key}) : super(key: key);
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

late Future<List> fetchData;
@override
  void initState() {
   fetchData=fetchDataFromApi();
  //  fetchData.whenComplete(() => fetchData.then((value) => print(value.toString())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            //backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
              
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.pink,
              ),
            ),
          ),
       body: FutureBuilder<List>(
        future: fetchData,
      builder: (ctx, snapshot) {
       
         
      if(snapshot.hasData){
        return  Container(
           height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
          child: GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                 // crossAxisSpacing: 2,
                  //mainAxisSpacing: 2,
                  crossAxisCount: 2,
                 // childAspectRatio: 1/2
                ),
                scrollDirection: Axis.vertical,
                
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileData()));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.red[600],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              // ignore: prefer_const_constructors, duplicate_ignore
                              CircleAvatar(
                                radius: 52,
                                backgroundColor: Colors.white,
                                // ignore: prefer_const_constructors
                                child: CircleAvatar(
                                  radius: 50,
                                   backgroundImage: NetworkImage(
                                                snapshot.data![index]
                                                        .profileImage ??
                                                    'null'),
                                ),
                              ),
                               //Padding(padding: EdgeInsets.only(bottom: 10)),
                              SizedBox(
                                  
                        
                                  child: Text(snapshot.data![index].name,
                                    maxLines: 2,
                                    
                                    overflow: TextOverflow.ellipsis,
                                    //"",
                                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        )
                        ),
                  );
                })),
        );
      }
      else{
       return Text("hjh");
      }
      
      },
      )
       
      ),
    );
  }
}

