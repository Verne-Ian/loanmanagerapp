import 'package:flutter/material.dart';
import 'viewPages/loading.dart';
import 'viewPages/home.dart';
import 'viewPages/Sign_up.dart';
import 'viewPages/Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loader(),
      '/home': (context) => MyHome(),
      '/login': (context) => defLogin(),
      '/register': (context) => signup()
    },
  ));
}




