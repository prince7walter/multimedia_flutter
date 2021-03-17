import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:multimedia_mob/model/studentData.dart';
import 'package:multimedia_mob/provider/url.dart';

class l1Provider extends ChangeNotifier{

  student_data data;
  int cls;

  l1Provider(int i){this.cls=i;}

  Future getData (context) async{

    switch (cls)
    {
      case 1 : final response = await http.get(Uri.parse(studentUrl+'1'));
               final jsonresponse = json.decode(response.body);
               this.data= student_data.fromJson(jsonresponse);
               this.notifyListeners();
      break;
      case 2 :  final response = await http.get(Uri.parse(studentUrl+'2'));
                final jsonresponse = json.decode(response.body);
                this.data= student_data.fromJson(jsonresponse);
                this.notifyListeners();
      break;
      case 3 :  final response = await http.get(Uri.parse(studentUrl+'3'));
                final jsonresponse = json.decode(response.body);
                this.data= student_data.fromJson(jsonresponse);
                this.notifyListeners();
      break;
      case 4 :  final response = await http.get(Uri.parse(studentUrl+'4'));
                final jsonresponse = json.decode(response.body);
                this.data= student_data.fromJson(jsonresponse);
                this.notifyListeners();
      break;
      case 5 :  final response = await http.get(Uri.parse(studentUrl+'5'));
                final jsonresponse = json.decode(response.body);
                this.data= student_data.fromJson(jsonresponse);
                this.notifyListeners();
      break;
    }
  }
}
