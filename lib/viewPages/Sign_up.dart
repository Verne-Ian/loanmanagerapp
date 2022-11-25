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


  @override
  void initState(){
    super.initState();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();

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
      print('Some fields are empty!');
    }
      Service.addUser(_fnameController.text, _lnameController.text, _phoneController.text,
        _emailController.text, _addressController.text).then((result){

          if('Action was Successful.' == result){
            clearFields();
          }
      });

  }
  clearFields(){
    _fnameController.text = '';
    _lnameController.text = '';
    _phoneController.text = '';
    _emailController.text = '';
    _addressController.text = '';
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