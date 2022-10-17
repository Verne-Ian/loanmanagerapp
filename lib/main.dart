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
    return Container(
      child: AppBar(
      backgroundColor: Colors.blue[300],
      title: Text(
        "Loan Manager",
        textAlign: TextAlign.center
      ),
      )

    );
  }
}

