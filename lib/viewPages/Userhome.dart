import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var uname;

  Future<dynamic> activeLoans() async{

    var url = 'http://192.168.43.31/LoanApp/allUsers.php';
    final response = await http.get(Uri.parse(url));
    var list = jsonDecode(response.body);
    return list;

  }
  @override
  void initState(){
    super.initState();
    activeLoans();
}

  @override
  Widget build(BuildContext context) {
    uname = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            '$uname\'s Dashboard',
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange[50]
            ),
          ),
          backgroundColor: Colors.black87,
          centerTitle: false,
          actions: [
            Row(
              children: [
                Text(
                  'Current Loans',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[50]
                  ),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    activeLoans();
                  });
                },
                  icon: const Icon(Icons.refresh_sharp),
                  tooltip: 'Reload',),
              ],
            )
          ],
        ),
        body: const Center(
          child: SpinKitFadingCube(
            color: Colors.orange,
            size: 30.0,
          )
        )
        );
  }
}