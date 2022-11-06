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
        ),
      ),

    );
  }
}
class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "New User Registration",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.amber,

          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 15.0,
                    ),
                  labelText: "First name",
                  hintText: "Enter first name.",
                    hintStyle: TextStyle(
                        fontSize: 10
                    )
                ),
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 15.0,
                    ),
                    labelText: "Last name",
                  hintText: "Enter Last name.",
                    hintStyle: TextStyle(
                        fontSize: 10
                    )
                ),
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      size: 15.0,
                    ),
                    labelText: "Phone number",
                  hintText: "+256xxxxxxxxx",
                    hintStyle: TextStyle(
                        fontSize: 10
                    )
                ),
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                        size: 15.0
                    ),
                    labelText: "Email",
                  hintText: "you@example.com",
                    hintStyle: TextStyle(
                        fontSize: 10
                    ),
                  contentPadding: EdgeInsets.all(10)
                ),
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: Icon(
                      Icons.local_post_office,
                        size: 15.0
                    ),
                    labelText: "Address",
                  hintText: "Physical address",
                    hintStyle: TextStyle(
                        fontSize: 10
                    )
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBar(
                      buttonHeight: 20,
                      children: [
                        ElevatedButton(onPressed: (){

                        },
                            child: Text(
                              "Submit",
                                style: TextStyle(
                                  color: Colors.black
                                ),
                            ),)
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),

    );
  }
}


