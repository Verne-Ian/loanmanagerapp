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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 120.0,
            ),
            const Divider(height: 70.0,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Username",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                )

              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
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
        children:  [
          const Text(
            "First Name"
          ),
          const TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Enter first name.",
            ),
          ),
          const SizedBox(height: 15.0,),
          const Text(
              "Last Name"
          ),
          const TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter last name."
            ),
          ),
          const SizedBox(height: 15.0,),
          const Text(
              "Phone number:"
          ),
          const TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter phone number."
            ),
          ),
          const SizedBox(height: 15.0,),
          const Text(
              "Email: "
          ),
          const TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter your email."
            ),
          ),
          const SizedBox(height: 15.0,),
          const Text(
              "Address: "
          ),
          const TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter your current."
            ),
          ),
          const SizedBox(height: 50.0,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  },style: const ButtonStyle(
                    ),
                      child: const Icon(
                        Icons.home,

                      ), ),
                ),
                Expanded(
                child: ElevatedButton(onPressed: (){

                },
                    child: const Icon(
                        Icons.save_alt
                    ) ))
              ],
            ),
        ],
      ),

    );
  }
}


