import 'dart:convert';

import 'package:apidemo/model/datamodel.dart';
import 'package:http/http.dart' as http;

import '../const/const.dart';

Future<List> fetchDataFromApi() async{
   http.Response res = await http.get(Uri.parse(ConstValues.API_URL));
    try {
      if (res.statusCode == 200) {
        List<dynamic> pro = json.decode(res.body);
       //print( pro.toList());
        return pro.map((e) => Welcome.fromJson(e)).toList();
      } else {
        // print('h');
        return [];
      }
    } catch (e) {
   
      return [];
    }



}