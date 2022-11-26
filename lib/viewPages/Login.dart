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

  Future Login() async{

    String uname = _unameController.text;
    String pass = _passController.text;
    String url = 'http://localhost/LoanApp/User.php';

    // Store all data with Param Name.
    var data = {'username': uname, 'password' : pass};

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    if(message == 'Logged in')
    {
      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.pushNamed(context, '/home');

    }else{

      // If Email or Password did not Matched.
      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: <Widget>[
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: Text("OK"),
              ),
            ],
          );
        },
      );}

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
                  Icons.account_circle,
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
                      )
                  ),
                ),
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
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 3.0, 0.0),
                      child: ElevatedButton( onPressed: () {
                        Login();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.transparent)
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          child: const Text(
                            "Create An Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
class details{
  user_details() {

  }
}