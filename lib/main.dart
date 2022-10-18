import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome()
  ));
}
class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loan Management Center",
        ),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Icon(
                Icons.account_circle,
                size: 120.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  )

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  )
              )),
            ),
            Expanded(
              child: FloatingActionButton(onPressed: () {
                runApp(MaterialApp(
                  home: signup()
                ));

              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0

                ),
              ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(



    );
  }
}


