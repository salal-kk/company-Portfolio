// ignore_for_file: prefer_const_constructors
import 'package:apidemo/controller/datafetchprovider.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:apidemo/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apidemo/model/datamodel.dart';
import 'package:provider/provider.dart';
import '../controller/apicall.dart';
//import 'package:maps_launcher/maps_launcher.dart';


class ProfileData extends StatelessWidget {
  late Future<List> fetchData;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<List>(
              future: context.read<DataFetchProvider>().data,
              builder: (ctx, snapshot)
               {
                if (snapshot.hasData) {
                
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 360,
                                    width: 180,
                                    child: Card(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30))),
                                      color: Colors.redAccent,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:0,right: 130),
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                               MyHomePage()));
                                                },
                                                icon:  Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.black45,
                                                )),
                                          ),
                                          CircleAvatar(
                                            radius: 52,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                                radius: 50,
                                                backgroundImage: NetworkImage(snapshot
                                                        .data![context.read<DataFetchProvider>().currentIndex].profileImage ?? ''
                                                  )),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(bottom: 30)),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                maxLines: 2,
                                                //overflow: TextOverflow.ellipsis,
                                                snapshot.data![context.read<DataFetchProvider>().currentIndex].name.toString()  ,
                                                style: TextStyle(
                                                    color:
                                                        Color.fromARGB(255, 0, 0, 0),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ))
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 360,
                                  width: 230,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          width: 200,
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25,
                                                top: 10,
                                                right: 2,
                                                left: 5),
                                            child: RichText(
                                              text: const TextSpan(
                                                  text: "Profile",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25)),
                                            ),
                                          )),
                                      RichText(
                                          textAlign: TextAlign.start,
                                          text:  TextSpan(
                                              text: "ID :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              children: [
                                                TextSpan(
                                                    text:snapshot.data![context.read<DataFetchProvider>().currentIndex].id.toString()   ,
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20))
                                              ])),
                                      RichText(
                                          textAlign: TextAlign.start,
                                          text:  TextSpan(
                                              text: "User Name :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              children: [
                                                TextSpan(
                                                    text: snapshot.data![context.read<DataFetchProvider>().currentIndex].username.toString()  ,
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20))
                                              ])),
                                      RichText(
                                          textAlign: TextAlign.start,
                                          text:  TextSpan(
                                              text: "Email :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              children: [
                                                TextSpan(
                                                    text: snapshot.data![context.read<DataFetchProvider>().currentIndex].email.toString()  ,
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20))
                                              ])),
                                      RichText(
                                          textAlign: TextAlign.start,
                                          text:  TextSpan(
                                              text: "Phone :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              children: [
                                                TextSpan(
                                                    text: snapshot.data![context.read<DataFetchProvider>().currentIndex].phone.toString()  ,
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20))
                                              ])),
                                      RichText(
                                          textAlign: TextAlign.start,
                                          text:  TextSpan(
                                              text: "Website :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              children: [
                                                TextSpan(
                                                    text: snapshot.data![context.read<DataFetchProvider>().currentIndex].website.toString()  ,
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20))
                                              ])),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, bottom: 20),
                                    child: Container(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text:  TextSpan(
                                              text: "Company",
                                              style: TextStyle(
                                                  color: Colors.red, fontSize: 20)),
                                        )),
                                  ),
                                  RichText(
                                      textAlign: TextAlign.start,
                                      text:  TextSpan(
                                          text: "Name :",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 20),
                                          children: [
                                            TextSpan(
                                                text: snapshot.data![context.read<DataFetchProvider>().currentIndex].company.name.toString()  ,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))
                                          ])),
                                  RichText(
                                      textAlign: TextAlign.start,
                                      text:  TextSpan(
                                          text: "Catch Phrase :",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 20),
                                          children: [
                                            TextSpan(
                                                text: snapshot.data![context.read<DataFetchProvider>().currentIndex].company.catchPhrase.toString() ,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))
                                          ])),
                                  RichText(
                                      textAlign: TextAlign.start,
                                      text:  TextSpan(
                                          text: "Bs :",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 20),
                                          children: [
                                            TextSpan(
                                                text:  snapshot.data![context.read<DataFetchProvider>().currentIndex].company.bs.toString() ,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))
                                          ])),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20, bottom: 15),
                                    child: Text(
                                      "Address",
                                      style:
                                          TextStyle(fontSize: 20, color: Colors.red),
                                    ),
                                  ),
                                   SizedBox(
                                      width: 250,
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        "${snapshot.data![context.read<DataFetchProvider>().currentIndex].address.street},${snapshot.data![context.read<DataFetchProvider>().currentIndex].address.suite},${snapshot.data![context.read<DataFetchProvider>().currentIndex].address.city},${snapshot.data![context.read<DataFetchProvider>().currentIndex].address.zipcode}",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  //const Image(image: AssetImage("219017-white-map-ui.png"))
                                ],
                              ),
                            ),
                            // SizedBox(
                            //     height: 200,
                            //     child: const Image(
                            //         image: NetworkImage(
                            //             "https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/map-route-image-6807-68565d04f06014aba2f90b32d2c61f45@1x.jpg")))
                          InkWell(
                            child: Container(
                              width: 480,
                                          height: 200,
                                          alignment: Alignment.center,
                                          child:Image(image: NetworkImage( "https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/map-route-image-6807-68565d04f06014aba2f90b32d2c61f45@1x.jpg"))
                            ),
                            onTap: (() {
                               MapsLauncher.launchCoordinates(
                                double.parse(snapshot.data![context.read<DataFetchProvider>().currentIndex].address.geo.lat),
                                double.parse(snapshot.data![context.read<DataFetchProvider>().currentIndex].address.geo.lng),
                               );
                                  
                              
                              
    
                            }),
                          )
                          
                          ],
                        ),
                      );
                   
               
                } else {
                  return Container(
                        margin: const EdgeInsets.only(bottom: 80.0),
                        child: const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red)),
                        ));;
                }
              })),
    );
  }
}
