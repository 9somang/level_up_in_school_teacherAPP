import 'package:flutter/material.dart';

class RegisterReqDto {
  final String? username;
  final String? userid;
  final String? password;
  final String? schoolcode;
  final String? classcode;
  final String? email;

  RegisterReqDto( this.username, this.userid, this.password, this.schoolcode,  this.classcode,this.email);

  Map<String, dynamic> toJson() => {
    "username" : username,
    "user_id" : userid ,
    "password" : password,
    "school_code" : schoolcode,
    "class_code" : classcode,
    "email" : email
  };
}