import 'dart:convert';
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
  static Future<String> addUser(String fname, String lname, int phone, String email, String address) async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = REGISTER_ACTION;
      map['first_name'] = fname;
      map['last_name'] = lname;
      map['phone_no'] = phone;
      map['email'] = email;
      map['local_address'] = address;
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