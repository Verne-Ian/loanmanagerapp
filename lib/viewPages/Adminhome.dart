import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loanmanagerapp/services/dataserver.dart';

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
  late TextEditingController _addressController;
  late TextEditingController _ulevelController;

//static const url = 'http://192.168.43.31/LoanApp/actions.php';

  var User_Name;

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
    Service.getLoans();
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
    User_Name = ModalRoute.of(context)!.settings.arguments;

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
                  'Current Users',
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
        body: FutureBuilder(
          future: Service.getLoans(),
          builder: (context, snapshot){
            if (snapshot.hasError) {
            if (kDebugMode) {
              print(snapshot.error);
            }
            }
            return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  List ulist = snapshot.data;
                  return Card(
                    margin: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 3.0),
                      child: ListTile(
                        onTap: null,
                        title: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4.0, 5.0, 2.0, 4.0),
                            child: Text('${ulist[index]['first_name'].toUpperCase()} ${ulist[index]['last_name'].toUpperCase()}'),
                          )),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('${ulist[index]['phone_no']} \n ${ulist[index]['email']}', style: const TextStyle(fontSize: 12.0),),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${ulist[index]['picture']}'),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.delete)),
                        ))));
                }):const Center(
              child: SpinKitFadingCube(
                color: Colors.orange,
                size: 30.0,
              ));})
    );
  }
}