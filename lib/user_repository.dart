
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_unit_testing_crud/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  String uri = "http://192.168.1.72:3001";
 
Future<List<UserModel>> getUser() async {
  List<UserModel> userModel = [];
  try{   
    http.Response res = await http.get(Uri.parse('$uri/api/getuser'),  headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }); 
      for(int i = 0; i < jsonDecode(res.body)['user'].length; i++) {
      
        userModel.add(UserModel.fromJson(jsonEncode(jsonDecode(res.body)['user'][i])));
       
      }
      return userModel;
  } catch (e) { 
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return userModel; 
}
}