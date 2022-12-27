import 'package:flutter/material.dart';
import 'package:loanmanagerapp/viewPages/addProfilePic.dart';
import 'viewPages/Adminhome.dart';
import 'viewPages/Userhome.dart';
import 'viewPages/loading.dart';
import 'viewPages/home.dart';
import 'viewPages/Sign_up.dart';
import 'viewPages/Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Loader(),
      '/home': (context) => const MyHome(),
      '/login': (context) => const defLogin(),
      '/register': (context) => const signup(),
      '/admin': (context) => const AdminHome(),
      '/user': (context) => const UserHome(),
      '/ProPic': (context) => const ProfilePic()
    },
  ));
}




