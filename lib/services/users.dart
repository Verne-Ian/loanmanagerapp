class User{
  var id;
  var fname;
  var lname;
  var phone;
  var email;
  var address;

  User({this.id, this.fname, this.lname, this.phone, this.email, this.address});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      id: json['ID'] as int,
      fname: json['first_name'] as String,
      lname: json['last_name'] as String,
      phone: json['phone_no'] as int,
      email: json['email'] as String,
      address: json['local_address'] as String
    );
  }

}