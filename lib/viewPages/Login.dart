import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Sign_up.dart';

class defLogin extends StatefulWidget {
  const defLogin({Key? key}) : super(key: key);

  @override
  State<defLogin> createState() => _defLoginState();

}

class _defLoginState extends State<defLogin> {
  final _unameController = TextEditingController();
  final _passController = TextEditingController();

  Future<List> login() async {

    //const login_act = 'login';
    //var map = <String, dynamic>{};
    //map['action'] = login_act;
    String msg;
    const login = 'http://192.168.43.31/LoanApp/User.php';
    final response = await http.post(Uri.parse(login), body: {
      "username": _unameController.text,
      "password": _passController.text,

    });

    var user = json.decode(response.body);

    if(user.length==0){
      setState(() {
        msg="Invalid username and password!";
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(msg,style: const TextStyle(
                  fontSize: 12.0
              )),
              icon: const Icon(Icons.warning_amber_outlined,
                size: 30.0,),
              actions: <Widget>[
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
                  clearFields();
                  },
                  child: const Text("OK",style: TextStyle(
                      fontSize: 12.0
                  )))]);});});
    }else if((user[0]['username'] == _unameController.text.toString()) || (user[0]['pass'] ==_passController.text.toString())){
      if(user[0]['ulevel']=='admin'){
        Navigator.pushReplacementNamed(context, '/admin', arguments:_unameController.text.toString());
      }else if(user[0]['ulevel']=='user'){
        Navigator.pushReplacementNamed(context, '/user', arguments: _unameController.text.toString());
      }
    }
    return user;
  }
  clearFields(){
    _unameController.text = '';
    _passController.text = '';
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Loan Management Center",
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_balance,
                  size: 120.0,
                ),
                const Divider(height: 70.0,),
                const SizedBox(height: 15.0,),
                TextField(
                  controller: _unameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        size: 15.0,
                      ),
                      labelText: "Username",
                      hintText: "Enter username.",
                      hintStyle: const TextStyle(
                          fontSize: 10
                      ))),
                const SizedBox(height: 15.0,),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      prefixIcon: const Icon(
                        Icons.password,
                        size: 15.0,
                      ),
                      labelText: "Password",
                      hintText: "Enter password",
                      hintStyle: const TextStyle(
                          fontSize: 10
                      ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 3.0, 0.0),
                      child: ElevatedButton( onPressed: () {
                        login();
                      },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.transparent)
                          )),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ))))]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                        child: ElevatedButton( onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const signup()),
                          );},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            elevation: 0.0,
                            shadowColor: Colors.grey[300],
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          child: const Text(
                            "New User? Create An Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.black
                            )))))])])))));
  }
}