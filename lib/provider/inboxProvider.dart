import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:multimedia_mob/model/inboxData.dart';
import 'package:multimedia_mob/provider/url.dart';

class inboxProvider extends ChangeNotifier{

  inbox_data data;

  var etd;
  inboxProvider(i){this.etd=i;}

  Future getData (context) async{

    final id = etd.toString();
    final response = await http.get(Uri.parse(inboxUrl+id));
    print('cccs');
    print(inboxUrl+etd.toString());

    final jsonresponse = json.decode(response.body);
    //print(jsonresponse["object"]);
    print('rttr');
    this.data= inbox_data.fromJson(jsonresponse);
    this.notifyListeners();
  }
}

