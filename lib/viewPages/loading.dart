import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}
var message = 'Connecting';
class _LoaderState extends State<Loader> with TickerProviderStateMixin {

  Future<dynamic> getConn() async{

    try {
      String url = "http://192.168.43.31/LoanApp/conn2.php";
      Response response = await get(Uri.parse(url));
      String resp = response.body;

      if (resp == 'Connected') {
        setState(() {
          message = 'Connected';
        });
        Future.delayed(const Duration(seconds: 3), () {
          //This will load the home page after showing the loading screen.
          Navigator.pushReplacementNamed(context, '/home');
        });
      } else if (resp != 'Connected') {
        setState(() {
          message = 'Server Error!';
        });
      }
    }on IOException{
      setState(() {
        message = 'No Internet!';
      });
    }
  }
  reload(){
    if(message == 'No Internet!'){
      return IconButton(
          onPressed: (){
        getConn();
      },
          icon: const Icon(
        Icons.refresh,
            color: Colors.white30,
            size: 30.0,
      ));
    }else{
      return Container();
    }
  }
  @override
  void initState(){
    super.initState();
    getConn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'THE LOAN MANAGER',
                    style: TextStyle(
                      color: Colors.orange[400],
                      fontSize: 30.0,
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
                    reload()
                  ]))]))));
  }
}
