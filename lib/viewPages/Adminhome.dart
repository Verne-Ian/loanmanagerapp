import 'package:firebase_auth/firebase_auth.dart';
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
  late TextEditingController _idController;
  late TextEditingController _amountController;

//static const url = 'http://192.168.43.31/LoanApp/actions.php';

  var User_Name;

  clear(){
    _amountController.text = '';
    _idController.text = '';
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
    _idController = TextEditingController();
    _amountController = TextEditingController();
    //getData();

  }

  @override
  Widget build(BuildContext context) {
    //User_Name = FirebaseAuth.instance.currentUser?.email;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const profile(),
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.yellow,
          centerTitle: true,
          actions: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '');
                },
                    icon: const Icon(Icons.account_circle_outlined),
                tooltip: 'Profile',),
              ])]
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.01),
            child: Column(
              children: [
                Card(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.04, width * 0.04, height * 0.05),
                    child: Column(
                      children: [
                        defaultField('Enter Amount', Icons.currency_exchange_sharp, true, _amountController, 'UGX'),
                        const SizedBox(height: 10.0,),
                        defaultField('Enter NIN', Icons.add_card_sharp, false, _idController, ''),
                        normalButton(context, 'Request', (){})
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}