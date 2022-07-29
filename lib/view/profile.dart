import 'package:apidemo/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:apidemo/model/datamodel.dart';
import '../controller/apicall.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  late Future<List> fetchData;
@override
  void initState() {
   fetchData=fetchDataFromApi();
  //  fetchData.whenComplete(() => fetchData.then((value) => print(value.toString())));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List>(
        future: fetchData,
      builder: (ctx, snapshot) {
        if(snapshot.hasData){
        return  Container(
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
                      color: const Color.fromARGB(255, 235, 155, 231),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 150),
                              child: IconButton(
                                  onPressed: () {
                                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ))),
                          const CircleAvatar(
                            radius: 52,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("Cristiano_Ronaldo_2018."),
                            ),
                          ),
                           Padding(padding: EdgeInsets.only(bottom: 30)),
                           SizedBox(
                              width: 100,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                "Cristiano Ronaldo",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
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
                                bottom: 25, top: 10, right: 2, left: 5),
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
                          text: const TextSpan(
                              text: "ID :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                    text: " 1",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ])),
                      RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "User Name :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                    text: " Cristiano_07",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ])),
                      RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Email :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                    text: " Cristiano@gmail.com",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ])),
                      RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Phone :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                    text: " 9000000001",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ])),
                      RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Website :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                    text: " Critiano_07.com",
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
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                              text: "Company",
                              style: TextStyle(color: Colors.red, fontSize: 20)),
                        )),
                  ),
                  RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                          text: "Name :",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                          children: [
                            TextSpan(
                                text: " Manchester United",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ])),
                  RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                          text: "Catch Phrase :",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                          children: [
                            TextSpan(
                                text: " Proactive didatic contigency",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ])),
                  RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                          text: "Bs :",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                          children: [
                            TextSpan(
                                text: " harness real-time e-markets",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    child: Text(
                      "Address",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                      width: 150,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "Kulas Light,Apt. 556,Gwwenborough,92998-3874",
                        style: TextStyle(color: Colors.black),
                      )),
                      const SizedBox(height: 30,),
                      //const Image(image: AssetImage("219017-white-map-ui.png"))
                ],
              ),
            ),
                SizedBox(height: 200,
                  child: const Image(image: NetworkImage("https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/map-route-image-6807-68565d04f06014aba2f90b32d2c61f45@1x.jpg")))

          ],
      ),
       );
  }
  else{
       return Text("hjh");
      }
  }
  )
  );
  }
}






                                                
                                                           
                                                               
                                                            
                                                        
                                                    