import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loanmanagerapp/services/users.dart';

class Service{

  static const ROOT = 'http://localhost/LoanApp/Control.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const REGISTER_ACTION = 'new_user';
  static const VIEW_Users_ACTION = 'GET_REC';
  static const DELETE_USER_ACTION ='delete_user';

  //This will create the user table in to the database.
  static Future<String> createTable() async {

    try{
    var map = Map<String, dynamic>();
    map['action'] = CREATE_TABLE_ACTION;
    final response = await http.post(Uri.parse(ROOT), body: map);
    print('Create Table Response: ${response.body}');
    return response.body;
  }catch(e){
      return "Errors!";
    }
  }

  //This will add the users on Registration.
  static Future<String> addUser(String first_name, String last_name, String phone_no, String email, String local_address,
      String username, String pass, String level) async{

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
      map['level'] = level;
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

  static Future<List<User>> getUsers() async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = VIEW_Users_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Get users: ${response.body}");

      if(200 == response.statusCode){
        List<User> list = parseResponse(response.body);
        return list;
      }else{
        return <User>[];
      }
    }catch(p){
      return <User>[];
    }
  }
  static List<User> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json)=>User.fromJson(json)).toList();
  }

  static Future<String> deleteUser(String userId) async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = DELETE_USER_ACTION;
      map['userId'] = userId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Delete action: ${response.body}');

      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error!";
      }

    }catch(p){
      return "Error!";
    }
  }

}