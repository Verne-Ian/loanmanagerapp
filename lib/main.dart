import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'viewPages/Adminhome.dart';
import 'viewPages/home.dart';
import 'viewPages/Sign_up.dart';
import 'viewPages/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Loader(),
    routes: {
      '/home': (context) => const MyHome(),
      '/login': (context) => const defLogin(),
      '/register': (context) => const signup(),
      '/admin': (context) => const AdminHome()
    },
  ));
}

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {

  var message = 'Checking Connection....';

  getConn() async{

    try {
      String url = "google.com";
      final response = await InternetAddress.lookup(url);

      if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
        setState(() {
          message = 'Connected';
        });
      }
    }on SocketException catch(e){
      setState(() {
        message = 'No Internet!';
      });
    }
  }

  next(){
    //This will load the home page after showing the loading screen.
    Future.delayed(const Duration(seconds: 3), () {
      if(FirebaseAuth.instance.currentUser == null){
        Navigator.pushReplacementNamed(context, 'login');
        }else{
        Navigator.pushReplacementNamed(context, '/home');
      }});
  }

  loadDisp() {
    if(message == 'Connected'){
      return Container(
        child: next(),
      );

    }else if(message=="Checking connection...."){
      return Container();
    }else if(message == 'Check your connection!'){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton.icon(
              onPressed: (){
                getConn();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.green,
                size: 30.0,
              ),
              label: const Text('Reload',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0))),
          TextButton(
            onPressed: (){SystemNavigator.pop();},
            child: Text('Close'),
          )
        ],
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton.icon(
              onPressed: (){
                getConn();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.green,
                size: 30.0,
              ),
              label: const Text('Reload',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                      fontSize: 15.0))),
          TextButton(
            onPressed: (){SystemNavigator.pop();},
            child: Text('Close'),
          )
        ],
      );
    }

  }

  @override
  void initState(){
    super.initState();
    getConn();
    loadDisp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1,
              MediaQuery.of(context).size.height * 0.3,
              MediaQuery.of(context).size.width * 0.1, 0.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'NEND LOAN APP',
                          style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          )),
                      Text(
                          'Your trusted loan platform.',
                          style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold
                          )),
                      const SizedBox(height: 40.0,),
                      const SpinKitFadingCube(
                        color: Colors.orange,
                        size: 30.0,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                          message,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                      child: loadDisp()),
                    ]),
          ),
        ));
  }
}




