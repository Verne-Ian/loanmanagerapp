import 'package:flutter/material.dart';
import 'Sign_up.dart';

class defLogin extends StatelessWidget {
  const defLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.all(15.0),
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 15.0,
                      ),
                      labelText: "Username",
                      hintText: "Enter username.",
                      hintStyle: TextStyle(
                          fontSize: 10
                      )
                  ),
                ),
                const SizedBox(height: 15.0,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        size: 15.0,
                      ),
                      labelText: "Password",
                      hintText: "Enter password",
                      hintStyle: TextStyle(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const signup()),
                        );},
                        style: ButtonStyle(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      child: ElevatedButton( onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const signup()),
                        );},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0
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