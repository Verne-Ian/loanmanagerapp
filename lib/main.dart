import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'viewPages/Adminhome.dart';
import 'viewPages/Sign_up.dart';
import 'viewPages/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MaterialApp(

    home: const Loader(),
    routes: {
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
    }on SocketException {
      setState(() {
        message = 'No Internet!';
      });
    }
  }

  next(){
    //This will load the home page after showing the loading screen.
    Future.delayed(const Duration(seconds: 3), () {
      if(FirebaseAuth.instance.currentUser == null){
        Navigator.pushReplacementNamed(context, '/login');
        }else{
        Navigator.pushReplacementNamed(context, '/admin');
      }});
  }

  loadDisp() {
    if(message == 'Connected'){
      return next();
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
                      color: Colors.black54,
                      fontSize: 15.0))),
          TextButton.icon(
            onPressed: (){SystemNavigator.pop();},
            label: const Text('Close',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 15.0)),
            icon: const Icon(Icons.exit_to_app,
              color: Colors.red,),
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
                      color: Colors.black54,
                      fontSize: 15.0))),
          TextButton.icon(
            onPressed: (){SystemNavigator.pop();},
            label: const Text('Close',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 15.0)),
            icon: const Icon(Icons.exit_to_app,
            color: Colors.red,),
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
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
        body: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [
            Colors.black,
            Colors.black87,
            Colors.yellow
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.3,
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.0),
            child: SingleChildScrollView(
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
                        const SizedBox(height: 25.0),
                        Text(
                            message,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        Padding(padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.3,
                        left: MediaQuery.of(context).size.width * 0.2,
                        right: MediaQuery.of(context).size.width * 0.2),
                        child: loadDisp()),
                      ]),
            ),
          ),
        ));
  }
}




