import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _newPassController;
  late TextEditingController _conPassController;
  late TextEditingController _userController;


  void newTable() async {
    Response response = await post(Uri.parse('http://192.168.43.31/LoanApp/actions.php'));
    String reply = response.body;
    print(reply);
    if(1050 == response.statusCode){
      print("Table Exists");
    }

  }
  addTable() {
    newTable();
    }

  Future<String> adduser(String fname, String lname, var phone, String email, String locAdd, String uname, var pass) async{
    //const add_user = 'add_user';
    var map = <String, dynamic>{};
    //map['action'] = add_user;
    map['first_name'] = fname;
    map['last_name'] = lname;
    map['phone_no'] = phone;
    map['email'] = email;
    map['local_address'] = locAdd;
    map['uname'] = uname;
    map['pass'] = pass;
    final response = await post(Uri.parse('http://192.168.43.31/LoanApp/addUser.php'), body: map);

    if(200 == response.statusCode){
      return response.body;
    }else{
      print("Error");
    }
    return response.body;
  }

  addUsers(){
    if((_newPassController.text == _conPassController.text) & _fnameController.text.isNotEmpty & _lnameController.text.isNotEmpty & _phoneController.text.isNotEmpty &
    _emailController.text.isNotEmpty & _addressController.text.isNotEmpty & _userController.text.isNotEmpty){
      adduser(_fnameController.text, _lnameController.text, _phoneController.text,
          _emailController.text, _addressController.text, _userController.text, _conPassController.text).then((result){
            if("Done" == result){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Done"),
                    actions: <Widget>[
                      ElevatedButton(onPressed: () {
                        clearFields();
                        Navigator.pushReplacementNamed(context, '/ProPic', arguments: _userController.text.toString());
                      },
                        child: const Text("OK"),
                      )]);});}
      });}
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Some fields are Empty!"),
            actions: <Widget>[
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: const Text("OK"),
              )]);});
    }
  }

  clearFields(){
    _fnameController.text = '';
    _lnameController.text = '';
    _phoneController.text = '';
    _emailController.text = '';
    _addressController.text = '';
    _userController.text = '';
    _newPassController.text = '';
    _conPassController.text = '';
  }



  @override
  void initState(){
    super.initState();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _newPassController = TextEditingController();
    _conPassController = TextEditingController();
    _userController = TextEditingController();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "New User Registration",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.amber,
          )),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:  [
              const SizedBox(height: 15.0,),
              TextField(
                controller: _fnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      size: 15.0,
                    ),
                    labelText: "First name",
                    hintText: "Enter first name.",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 15.0,),
              TextField(
                controller: _lnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      size: 15.0,
                    ),
                    labelText: "Last name",
                    hintText: "Enter Last name.",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 15.0,),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                      Icons.phone,
                      size: 15.0,
                    ),
                    labelText: "Phone number",
                    hintText: "+256xxxxxxxxx",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 15.0,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                        Icons.alternate_email,
                        size: 15.0
                    ),
                    labelText: "Email",
                    hintText: "you@example.com",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ),
                    contentPadding: const EdgeInsets.all(10)
                )),
              const SizedBox(height: 15.0,),
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      size: 15.0,
                    ),
                    labelText: "Username",
                    hintText: "ian255",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 15.0,),
              TextField(
                obscureText: true,
                controller: _newPassController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                        Icons.password,
                        size: 15.0
                    ),
                    labelText: "New Password",
                    hintText: "Minimum 8 Characters..",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 15.0,),
              TextField(
                obscureText: true,
                controller: _conPassController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                        Icons.password,
                        size: 15.0
                    ),
                    labelText: "Confirm Password",
                    hintText: "Make sure passwords match...",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 15.0,),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(
                        Icons.local_post_office,
                        size: 15.0
                    ),
                    labelText: "Address",
                    hintText: "Physical address",
                    hintStyle: const TextStyle(
                        fontSize: 10
                    ))),
              const SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ElevatedButton.icon(onPressed: (){
                        addUsers();
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            elevation: 0.0,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          icon: const Icon(Icons.arrow_right_outlined,
                            color: Colors.green,),
                          label: const Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                            ))))])])))
    );
  }
}