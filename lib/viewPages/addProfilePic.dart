import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);


  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  var uname;
  final picker = ImagePicker();
  late File? _image = null;
  late bool pressable;

  Future selectedImage() async {

    var selectedImage = await picker.pickImage(source: ImageSource.gallery);
    setState((){
      _image = File(selectedImage!.path);
    });
  }
  dispImage(){
    if(_image == null){
      pressable = false;
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.warning_amber_outlined,color: Colors.red,),
            SizedBox(width: 5.0,),
            Text('No Image Selected!',
            style: TextStyle(fontSize: 20.0),),
          ],
        ),
      );
    }else if(_image != null){
      pressable = true;
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SpinKitFadingCube(
              color: Colors.orange,
              size: 15.0,
            ),
            const SizedBox(height: 5.0),
            Image.file(_image!),
          ],
        ),
      );
    }
  }

  @override
  void initState(){
    super.initState();
    dispImage();
}
  @override
  Widget build(BuildContext context) {
    uname = ModalRoute.of(context)!.settings.arguments;

    Future uploadPic() async{
      final url = Uri.parse('http://192.168.43.31/LoanApp/propic.php');
      var request = http.MultipartRequest('POST', url);
      request.fields['uname'] = uname;
      var image = await http.MultipartFile.fromPath('pic', _image!.path);
      request.files.add(image);

      var response = await request.send();

      if(response.statusCode == 200){
        print('Image uploaded.');
      }else{
        print('Image not uploaded.');
      }

    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '$uname, add your profile picture.',
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.orange
          )),centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dispImage(),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                      child: ElevatedButton.icon(onPressed: selectedImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.orange,),
                          label: const Text(
                            'Add Image',
                            style: TextStyle(color: Colors.black),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 2.0,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          )),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                        child: ElevatedButton.icon(onPressed: (){
                          if(pressable == false){ null; }else{ uploadPic(); }
                        },
                    label: const Text(
                          'Next',
                    style: TextStyle(color: Colors.black)),
                    icon: const Icon(
                        Icons.next_plan_outlined,
                    color: Colors.green,),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 2.0,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                  ),
                      ))])]))));
  }
}
