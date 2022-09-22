import 'dart:convert';



class user {
  user({

    required this.password,
    required this.email,
    required this.credits,
    required this.location,
    required this.name

  });


  final String name;
  final  String password;
  final String email;
final int credits;
final String location;



  factory user.fromJson(Map<String, dynamic> json){
    return user(

      name: json["name"] as String,
      password: json["password"] as String,
      email: json["email"] as String,
      credits: json["amount"] as int,
        location:json["location"] as String

    );
  }


}
