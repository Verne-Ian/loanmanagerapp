import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'users.dart';

class Service{
  static const ROOT = 'http://localhost/LoanApp/Control.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const REGISTER_ACTION = 'new_user';
  static const VIEW_ACTION = 'GET_REC';
  static const Update = 'update_user';
  static const Users_ACTION = 'Get_users';
  static const DEL_User = 'delete_user';


  //This will create the user table in to the database.
  /*static Future<String> newTable() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = CREATE_TABLE_ACTION;
      Response response = await http.post(Uri.parse(ROOT), body: map);
      print(response.body);
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error";
      }
    }catch(p){
      return 'Error';
    }

  }*/
  static Future<List<User>> getUser() async {
    try{
      var map = <String, dynamic>{};

      final response = await post(Uri.parse('http://localhost/LoanApp/allUsers.php'),body: map);
      print('Get Users: ${response.body}');

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

  static List<User> parseResponse(String body) {
    final parsed = jsonDecode(body).cast<Map<String, dynamic>>();
    return parsed.map<User>((json)=>User.fromJson(json)).toList();
  }

  static Future<String> addUser(var first_name, var last_name, int phone_no, var email, var local_address, var uname, var password) async{
    try{
      var map = <String, dynamic>{};
      map['action'] = REGISTER_ACTION;
      map['first_name'] = first_name;
      map['last_name'] = last_name;
      map['phone_no'] = phone_no;
      map['email'] = email;
      map['local_address'] = local_address;
      map['uname'] = uname;
      map['pass'] = password;

      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Add Users: ${response.body}');

      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error";
      }
    }catch(p){
      return "Error";
    }
  }
  static Future<String> updater(var ID, var first_name, var last_name, int phone_no, var email, var local_address, var uname, var password, var lev) async{
    try{
      var map = <String, dynamic>{};
      map['action'] = Update;
      map['userId'] = ID;
      map['first_name'] = first_name;
      map['last_name'] = last_name;
      map['phone_no'] = phone_no;
      map['email'] = email;
      map['local_address'] = local_address;
      map['uname'] = uname;
      map['pass'] = password;
      map['ulevel'] = lev;

      final response = await http.post(Uri.parse(ROOT), body: map);
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
      map['action'] = DEL_User;
      map['userId'] = ID;

      final response = await http.post(Uri.parse(ROOT), body: map);
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
}