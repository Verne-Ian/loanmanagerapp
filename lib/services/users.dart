// ignore_for_file: prefer_typing_uninitialized_variables

class User{
  var ID;
  var first_name;
  var last_name;
  var phone_no;
  var email;
  var local_address;
  var uname;
  var password;
  var ulevel;

  User({this.ID, this.first_name, this.last_name, this.phone_no, this.email, this.local_address, this.uname, this.password, this.ulevel});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      ID: json['ID'] as int,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      phone_no: json['phone_no'] as int,
      email: json['email'] as String,
      local_address: json['local_address'] as String,
      uname: json['username'] as String,
      password: json['pass'] as String,
      ulevel: json['ulevel'] as String
    );
  }

}