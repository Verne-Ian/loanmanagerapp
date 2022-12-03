import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loanmanagerapp/services/dataserver.dart';
import 'package:http/http.dart' as http;



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
  late TextEditingController _addressController;
  late TextEditingController _ulevelController;

  Future<dynamic> generateUsers() async {
    // Give your sever URL of get_employees_details.php file
    var url = 'http://localhost/LoanApp/allUsers.php';
    final response = await http.get(Uri.parse(url));
    var list = jsonDecode(response.body);
    return list;
  }
  Future<String> updater(var ID, var first_name, var last_name, var phone_no, var email, var local_address, var ulevel) async{
    try{
      var map = <String, dynamic>{};
      map['userId'] = ID;
      map['first_name'] = first_name;
      map['last_name'] = last_name;
      map['phone_no'] = phone_no;
      map['email'] = email;
      map['local_address'] = local_address;
      map['ulevel'] = ulevel;

      final response = await http.post(Uri.parse('http://localhost/LoanApp/Updateuser.php'), body: map);
      print('Update User: ${response.body}');

      if(200 == response.statusCode){
        return response.body;
      }else{
        return "Error";
      }
    }catch(p){
      return "Error";
    }
  }

  var uname;

  /*getData() {
     Service.getUser().then((users){
       setState(() {
         _users = users;
       });
       print("${users.length}");
     });
  }*/

  clear(){
    _addressController.text = '';
    _emailController.text = '';
    _phoneController.text = '';
    _lnameController.text = '';
    _fnameController.text ='';
    _ulevelController.text = '';
  }
  @override
  void initState() {
    super.initState();
    generateUsers();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _ulevelController = TextEditingController();
    //getData();

  }

  @override
  Widget build(BuildContext context) {
    uname = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            '$uname\'s Dashboard',
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
                  'Current Users',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[50]
                  ),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    generateUsers();
                  });
                },
                    icon: const Icon(Icons.refresh_sharp),
                tooltip: 'Reload',),
              ],
            )
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: generateUsers(),
            builder: (context, snapshot){
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData ? ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    List ulist = snapshot.data;
                    return SingleChildScrollView(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 3.0),
                          child: ListTile(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      title: Text('Update ${ulist[index]['first_name']}\'s Account'),
                                      actions: <Widget>[
                                        Column(
                                          children: [
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
                                            const SizedBox(height: 15.0,),
                                            TextField(
                                              controller: _ulevelController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15)
                                                  ),
                                                  prefixIcon: const Icon(
                                                      Icons.local_post_office,
                                                      size: 15.0
                                                  ),
                                                  labelText: "Auth-Level",
                                                  hintText: "Admin or User",
                                                  hintStyle: const TextStyle(
                                                      fontSize: 10
                                                  )
                                              ),
                                            ),
                                            const SizedBox(height: 15.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(onPressed: () {
                                                  Service.updater(ulist[index]['ID'], _fnameController.text, _lnameController.text, _phoneController.text,
                                                      _emailController.text, _addressController.text, _ulevelController.text).then((result) {
                                                    clear();
                                                    Navigator.of(context).pop();
                                                  });
                                                }, icon: const Icon(
                                                    Icons.update
                                                ),
                                                tooltip: 'Update',),
                                                ElevatedButton(onPressed: () {
                                                  generateUsers();
                                                  Navigator.of(context).pop();
                                                },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                    elevation: 0.0,
                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                                  ),
                                                  child: const Text('Done', style: TextStyle(
                                                      color: Colors.black
                                                  ),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            title: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4.0, 5.0, 2.0, 4.0),
                                child: Text('${ulist[index]['first_name'].toUpperCase()} ${ulist[index]['last_name'].toUpperCase()}'),
                              ),
                            ),
                            subtitle: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${ulist[index]['phone_no']}  ${ulist[index]['email']}', style: const TextStyle(fontSize: 12.0),),
                              ),
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('User ID: ${ulist[index]['ID']}'),
                            ),
                            trailing: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(onPressed: (){
                                var ID = '${ulist[index]['ID']}';
                                Service.deleter(ID).then((result){
                                    setState(() {
                                      generateUsers();
                                    });
                                });
                              }, icon: const Icon(Icons.delete)),
                            ),

                          ),
                        ),
                      ),
                    );
                  }):const Center(
                child: SpinKitCircle(
                  color: Colors.orange,
                  size: 30.0,
                ),
              );
            },
          ),
        )
    );
  }
}