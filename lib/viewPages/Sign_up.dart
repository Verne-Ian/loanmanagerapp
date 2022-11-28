import 'package:flutter/material.dart';
import 'package:loanmanagerapp/services/dataserver.dart';


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
  addTable(){
    Service.createTable().then((result){
      if("Success." == result){
        print('Table Created!');
      }
    });
  }
  addUsers(){
    if(_fnameController.text.isEmpty || _lnameController.text.isEmpty || _phoneController.text.isEmpty
        || _emailController.text.isEmpty || _addressController.text.isEmpty){
      var message = ("Some fields are empty!");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: <Widget>[
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: Text("OK"),
              ),
            ],
          );
        },
      );

    }else{
      String lev = "user";
      Service.addUser(_fnameController.text, _lnameController.text, _phoneController.text,
        _emailController.text, _addressController.text,_userController.text ,_conPassController.text, lev).then((result){

          var success = "Success";
          showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(success),
              actions: <Widget>[
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
                  clearFields();
                },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
          if('Successful' == result){
            clearFields();
          }
      });
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

          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      )
                  ),
                ),
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
                      )
                  ),
                ),
                const SizedBox(height: 15.0,),
                TextField(
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
                      )
                  ),
                ),
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
                  ),
                ),
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
                      )
                  ),
                ),
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
                      )
                  ),
                ),
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
                      )
                  ),
                ),
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
                      )
                  ),
                ),
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
                            icon: const Icon(Icons.check,
                              color: Colors.green,),
                            label: const Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                              ),
                            ))
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(onPressed: (){
                        addTable();
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            elevation: 0.0,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          icon: const Icon(Icons.add,
                          color: Colors.lightBlue,),
                          label: Text(
                            "Add Table",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              backgroundColor: Colors.grey[300]
                            ),
                          ))
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}