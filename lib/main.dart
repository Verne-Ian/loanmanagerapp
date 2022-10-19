import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHome()
  ));
}
class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Loan Management Center",
        ),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Icon(
                Icons.account_circle,
                size: 120.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
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
                runApp(const MaterialApp(
                  home: signup()
                ));

              },
              child: const Text(
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "New User Registration",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23.0,
            color: Colors.amber,

          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "First Name"
          ),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Enter first name.",
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
              "Last Name"
          ),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter last name."
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
              "Phone number:"
          ),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter phone number."
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
              "Email: "
          ),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter your email."
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
              "Address: "
          ),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter your current."
            ),
          )
        ],
      ),

    );
  }
}


