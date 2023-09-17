
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
      if(res.statusCode == 200){
      for(int i = 0; i < jsonDecode(res.body)['user'].length; i++) {
       
        userModel.add(UserModel.fromJson(jsonEncode(jsonDecode(res.body)['user'][i])));
      }
      return userModel;
      }
  } catch (e) { 
    if (kDebugMode) {
      print(e.toString());
    }
  }
  throw Exception('Some Error Occured!'); 
}

Future<UserModel> deleteUser(String name) async {
  UserModel userModel;
  try{    
    http.Response res = await http.delete(Uri.parse('$uri/api/deleteuser/$name'),  headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });   
      if(res.statusCode == 200) {
        userModel = UserModel.fromJson(res.body);
      return userModel; 
      }
  } catch (e) { 
    if (kDebugMode) {
      print(e.toString());
    }
  }
  throw Exception('Some Error Occured!'); 
}

Future<UserModel> updateUser(String name, String newname) async { 
  UserModel userModel;
  try{    
    http.Response res = await http.put(Uri.parse('$uri/api/updateuser/?name=$name&newname=$newname'),  headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });    
      if(res.statusCode == 200) {
        userModel = UserModel.fromJson(res.body);
      return userModel; 
      }
  } catch (e) {  
    if (kDebugMode) {
      print(e.toString());
    }
  }
  throw Exception('Some Error Occured!'); 
}

Future<UserModel> createUser(String name, String email) async {
  UserModel userModel;
  UserModel postModel = UserModel(name, email);
  try{   
    http.Response res = await http.post(Uri.parse('$uri/api/newuser'),  headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }, 
       
      body: postModel.toJson());       
      if(res.statusCode == 200) {
        userModel = UserModel.fromJson(res.body);
      return userModel;  
      }
  } catch (e) { 
    if (kDebugMode) {
      print(e.toString());
    }
  }
  throw Exception('Some Error Occured!'); 
}


}