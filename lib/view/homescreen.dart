// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:apidemo/model/datamodel.dart';
import 'package:apidemo/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/apicall.dart';
import '../controller/datafetchprovider.dart';


class MyHomePage extends StatelessWidget {

late Future<List> fetchData;

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
        future: context.read<DataFetchProvider>().data,
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
                      context.read<DataFetchProvider>().setIndex(index: index,context: context);


                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ProfileData()));
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
                                  
                        
                                  child: Text(snapshot.data![index].name ?? 'null',
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
       return Container(
                      margin: const EdgeInsets.only(bottom: 80.0),
                      child: const Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red)),
                      ));;
      }
      
      },
      )
       
      ),
    );
  }
}

