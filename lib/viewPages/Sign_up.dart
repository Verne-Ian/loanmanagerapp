import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


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
    Response response = await post(Uri.parse('http://localhost/LoanApp/TableCreate.php'));
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
    var map = <String, dynamic>{};
    map['first_name'] = fname;
    map['last_name'] = lname;
    map['phone_no'] = phone;
    map['email'] = email;
    map['local_address'] = locAdd;
    map['uname'] = uname;
    map['pass'] = pass;
    final response = await post(Uri.parse('http://localhost/LoanApp/addUser.php'), body: map);

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
                        uploadPic();
                        clearFields();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
      });}
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Some fields are Empty!"),
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
  final picker = ImagePicker();
  late File _image;

  Future selectedImage() async {

    var selectedImage = await picker.pickImage(source: ImageSource.gallery);
    setState((){
      _image = File(selectedImage!.path);
    });
  }
  Future uploadPic() async{
    final Url = Uri.parse('http://localhost/LoanApp/propic.php');
    var request = http.MultipartRequest('POST', Url);
    request.fields['uname'] = _userController.text;
    var image = await http.MultipartFile.fromPath('proPic', _image.path);
    request.files.add(image);

    var response = await request.send();

    if(response.statusCode == 200){
      print('Image uploaded.');
    }else{
      print('Image not uploaded.');
    }

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
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Add Picture."),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(onPressed: () {
                                        selectedImage();
                                      }, icon: const Icon(
                                          Icons.add_a_photo
                                      )),
                                      ElevatedButton(onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 0.0,
                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                        ),
                                        child: const Text('Cancel', style: TextStyle(
                                          color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              elevation: 0.0,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                            ),
                            icon: const Icon(Icons.add_a_photo,
                              color: Colors.lightBlue,),
                            label: Text(
                              "Add Profile Picture",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  backgroundColor: Colors.grey[300]
                              ),
                            ))
                    ),
                  ],
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
                ),]),
          ),
        ),
      ),

    );
  }
}