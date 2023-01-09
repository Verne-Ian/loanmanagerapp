
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../Addons/buttons&fields.dart';

class defLogin extends StatefulWidget {
  const defLogin({Key? key}) : super(key: key);

  @override
  State<defLogin> createState() => _defLoginState();

}

class _defLoginState extends State<defLogin> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<void> login() async{

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text).then((value){
          Navigator.pushReplacementNamed(context, '/admin',
              arguments: FirebaseAuth.instance.currentUser?.email);

    }).onError((error, stackTrace){

      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
            title: const Text("Invalid Email or Passwaord!"),
            actions: <Widget>[
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
                clearFields();
              },
                child: const Text("OK"),
              )]);});
    });

  }

  clearFields(){
    _emailController.text = '';
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
          "Nend Loans",
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
                  Icons.account_box_outlined,
                  size: 120.0,
                ),
                const Divider(height: 70.0,),
                const SizedBox(height: 15.0,),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        size: 15.0,
                      ),
                      labelText: "Email",
                      hintText: "Enter email.",
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
                loginSignUpButton(context, true, (){login();}),
                signUpOption(),
                ])))));
  }


  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Are you new?',
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
          child: const Text('Create Account',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        )
      ],
    );

  }
}