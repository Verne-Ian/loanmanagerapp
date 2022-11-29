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

   getData() {
     Service.getUser().then((users){
       setState(() {
         _users = users;
       });
       print("${users.length}");
     });
  }

  @override
  void initState(){
    super.initState();
    _users = [];
    getData();

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
            columns: const [DataColumn(label: Text('ID',style: TextStyle(color: Colors.white),)),
              DataColumn(label: Text('First_Name',style: TextStyle(color: Colors.white),)),
              DataColumn(label: Text('Last_Name',style: TextStyle(color: Colors.white),)),
              DataColumn(label: Text('Username',style: TextStyle(color: Colors.white),)),
              DataColumn(label: Text('Contact',style: TextStyle(color: Colors.white),)),
              DataColumn(label: Text('Email',style: TextStyle(color: Colors.white),)),
              DataColumn(label: Text('User_Level',style: TextStyle(color: Colors.white),))
            ],
            rows: _users.map(
                    (user) => DataRow(cells: [
              DataCell(
                  Text(user.ID)
              ),
              DataCell(
                  Text(user.first_name)
              ),
              DataCell(
                  Text(user.last_name)
              ),
              DataCell(
                  Text(user.uname)
              ),
              DataCell(
                  Text(user.phone_no.toString())
              ),
              DataCell(
                  Text(user.email)
              ),
              DataCell(
                  Text(user.lev)
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
            const Divider(height: 10.0, thickness: 3.0, endIndent: 5.0, indent: 5.0,),

            Expanded(child: _table()),
          ],
        ),
      ),
    );
  }
}