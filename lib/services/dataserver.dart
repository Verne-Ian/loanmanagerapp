import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class Service{

  static Future<dynamic> getLoans() async {
    // This function will contact the server for the json file containing the database table.
    var url = 'http://192.168.43.31/LoanApp/allUsers.php';
    final response = await http.get(Uri.parse(url));
    var list = jsonDecode(response.body);
    return list;
  }



}