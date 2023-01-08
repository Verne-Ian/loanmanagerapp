import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Object? uname;
    uname = ModalRoute.of(context)!.settings.arguments;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('$uname\'s Dashboard'),
              accountEmail: const Text('you@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(child: Image.network('http://192.168.43.31/LoanApp/User.php',
            fit: BoxFit.cover,
            width: 90,
            height: 60,)),
          ),
          decoration: const BoxDecoration(
            color: Colors.black
          ),),
          const ListTile(
            leading: Icon(Icons.feedback,
            size: 20.0,),
            title: Text('Support',
            style: TextStyle(
              fontSize: 15.0
            ),),
            onTap: null,
          ),
          ListTile(
            leading: const Icon(Icons.policy_sharp,
              size: 20.0,),
            title: const Text('Terms and Policies',
              style: TextStyle(
                  fontSize: 15.0
              ),),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/');},
          ),
          ListTile(
            leading: const Icon(Icons.logout,
            size: 20.0,),
            title: const Text('Log Out',
              style: TextStyle(
                  fontSize: 15.0
              ),),
            onTap: (){
              FirebaseAuth.instance.signOut().then((value){
                Navigator.pushReplacementNamed(context, '/login');
              });
              }
          ),
          ListTile(
            leading: const Icon(Icons.close_outlined,
            size: 20.0),
            title: const Text('Exit App',
              style: TextStyle(
                  fontSize: 15.0
              ),),
            onTap: (){SystemNavigator.pop();},
          )
        ],
      )
    );
  }
}