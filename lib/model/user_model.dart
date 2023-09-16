// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
 final String name;
 final String email;

  UserModel(this.name, this.email);



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    }; 
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '' ,
      map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
