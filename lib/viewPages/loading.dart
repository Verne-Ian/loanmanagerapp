import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  void getConn() async{

    String url = "http://localhost/LoanApp/Control.php";
    Response response = await get(Uri.parse(url));
    print(response.body);
    Navigator.pushReplacementNamed(context, '/home');

  }
  @override
  void initState(){
    super.initState();
    getConn();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SpinKitSquareCircle(
        color: Colors.red,
        size: 50.0,
      ),
      ),
    );
  }
}
