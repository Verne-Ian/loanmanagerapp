// ignore_for_file: prefer_typing_uninitialized_variables

class User{
  var ID;
  var first_name;
  var last_name;
  var phone_no;
  var email;
  var address;

  User({this.ID, this.first_name, this.last_name, this.phone_no, this.email, this.address});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      ID: json['ID'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      phone_no: json['phone_no'],
      email: json['email'],
      address: json['local_address']
    );
  }

}