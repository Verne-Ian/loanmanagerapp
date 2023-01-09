import 'package:flutter/material.dart';
import 'package:loanmanagerapp/services/dataserver.dart';

import '../Addons/buttons&fields.dart';
import '../Addons/side_profile.dart';



class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _amountController;

//static const url = 'http://192.168.43.31/LoanApp/actions.php';

  var User_Name;

  clear(){
    _amountController.text = '';
    _emailController.text = '';
    _phoneController.text = '';
    _lnameController.text = '';
    _fnameController.text ='';
  }
  @override
  void initState() {
    super.initState();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _amountController = TextEditingController();
    //getData();

  }

  @override
  Widget build(BuildContext context) {
    User_Name = ModalRoute.of(context)!.settings.arguments;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
        backgroundColor: Colors.grey[300],
        drawer: const profile(),
        appBar: AppBar(
          title: Text(
            '$User_Name\'s Dashboard',
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange[50]
            ),
          ),
          backgroundColor: Colors.black87,
          centerTitle: false,
          actions: [
            Row(
              children: [
                Text(
                  'Refresh',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[50]
                  )
                ),
                IconButton(onPressed: (){
                  setState(() {
                    Service.getLoans();
                  });
                },
                    icon: const Icon(Icons.refresh_sharp),
                tooltip: 'Reload',),
              ])]
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.1),
                child: Container(
                  child: Column(
                    children: [
                      defaultField(
                          'Enter Amount',
                          Icons.currency_exchange_sharp,
                          true, _amountController, 'UGX'),


                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}