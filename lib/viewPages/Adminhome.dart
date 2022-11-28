import 'package:flutter/material.dart';
import 'package:loanmanagerapp/services/dataserver.dart';

import '../services/users.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late List<User> _users;
  late User selectedUser;
  var uname;

  myUsers(){
    Service.getUsers().then((users){
      setState(() {
        _users = users;
      });
      print('Length is ${users.length}');
    });
  }
  del_users(User user){
    Service.deleteUser(user.ID).then((result){
      if('Successful' == result){
        myUsers();
      }
    });
  }

  @override
  void initState(){
    super.initState();
    _users = [];
    myUsers();
  }
  @override
  Widget build(BuildContext context) {

    uname = ModalRoute.of(context)!.settings.arguments;


    SingleChildScrollView _table(){
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [DataColumn(label: Text('ID')),
              DataColumn(label: Text('First_Name')),
              DataColumn(label: Text('Last_Name')),
              DataColumn(label: Text('Username')),
              DataColumn(label: Text('Contact')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('User_Level'))
            ],
            rows: _users.map((users) => DataRow(cells: [
              DataCell(
                  Text(users.ID)
              ),
              DataCell(
                  Text(users.first_name.toUpperCase())
              ),
              DataCell(
                  Text(users.last_name.toUpperCase())
              ),
              DataCell(
                  Text(users.uname)
              ),
              DataCell(
                  Text(users.phone_no.toString())
              ),
              DataCell(
                  Text(users.email)
              ),
              DataCell(
                  Text(users.level)
              )
            ])).toList(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Loan Manager App',
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: Text(
                '$uname\'s Dashboard',
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[50]
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
              child: Icon(
                  Icons.account_balance,
                  size: 90.0,
                  color: Colors.orange[600]
              ),
            ),
            Divider(height: 10.0, thickness: 3.0, endIndent: 5.0, indent: 5.0,),

            Expanded(child: _table()),
          ],
        ),
      ),
    );
  }
}
