import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class Service{
  static const ROOT = 'http://192.168.43.31/LoanApp/actions.php';
  static const Update = 'update_user';
  static const del_user = 'del_user';

  static Future<String> updater(var ID, var first_name, var last_name, var phone_no, var email, var local_address, var ulevel) async{
    try{
      var map = <String, dynamic>{};
      //map['action'] = Update;
      map['userId'] = ID;
      map['first_name'] = first_name;
      map['last_name'] = last_name;
      map['phone_no'] = phone_no;
      map['email'] = email;
      map['local_address'] = local_address;
      map['ulevel'] = ulevel;

      final response = await http.post(Uri.parse('http://192.168.43.31/LoanApp/Updateuser.php'), body: map);
      print('Update User: ${response.body}');

      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error";
      }
    }catch(p){
      return "Error";
    }
  }
  static Future<String> deleter(var ID) async{
    try{
      var map = <String, dynamic>{};
      //map['action'] = del_user;
      map['userId'] = ID;
      final response = await http.post(Uri.parse('http://192.168.43.31/LoanApp/delUser.php'), body: map);
      print('Delete User: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error";
      }
    }catch(p){
      return "Error";
    }
  }

}