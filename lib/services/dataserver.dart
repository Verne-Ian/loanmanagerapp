import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'users.dart';

class Service{
  static const ROOT = 'http://localhost/LoanApp/Control.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const REGISTER_ACTION = 'new_user';
  static const VIEW_ACTION = 'GET_REC';

  //This will create the user table in to the database.
  static Future<String> createTable() async {
    try{
    var map = Map<String, dynamic>();
    map['action'] = CREATE_TABLE_ACTION;
    final response = await http.post(Uri.parse(ROOT), body: map);
    print('Create Table Response: ${response.body}');
    return response.body;
  }catch(e){
      return "Error!";
    }
  }

  //This will add the users on Registration.
  static Future<String> addUser(String first_name, String last_name, String phone_no, String email, String local_address,
      String username, String pass) async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = REGISTER_ACTION;
      map['first_name'] = first_name;
      map['last_name'] = last_name;
      map['phone_no'] = phone_no;
      map['email'] = email;
      map['local_address'] = local_address;
      map['username'] = username;
      map['pass'] = pass;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addUser Response: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error!";
      }
    }catch(e){
      return "Error!";
    }

  }
}