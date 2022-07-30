import 'package:apidemo/controller/apicall.dart';
import 'package:flutter/cupertino.dart';

class DataFetchProvider extends ChangeNotifier{
  Future<List> data=fetchDataFromApi();
  int currentIndex=0;
  setIndex({index,context}){
    currentIndex=index;
    notifyListeners();

  }
}