import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                        child: Text(
                          'Loan Management Center',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[50]
                          )))]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 20.0),
                            child: Text(
                                'For organised loan tracking.',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange[100]
                                )))]),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 40.0),
                      child: Icon(
                          Icons.account_balance,
                          size: 140.0,
                          color: Colors.orange[600]
                      )),
                  const Divider(height: 10.0, thickness: 3.0, endIndent: 20.0, indent: 20.0,
                  color: Colors.grey)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 12.0, 0.0),
                    child: ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.blueGrey,
                          fixedSize: const Size(200.0, 50.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20.0
                        )))),
                  const SizedBox(height: 10.0),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 12.0, 0.0),
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.grey[600],
                              fixedSize: const Size(200.0, 50.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )),
                          child: const Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 20.0
                              )))),
                ],
              ),
              ]),
        )),
    );
  }
}

