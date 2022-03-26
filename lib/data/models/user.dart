import 'dart:convert';

import 'package:fresh/globals/constants/globals.dart';

class User {
  String? userName;
  String? phoneNumber;
  String? password;
  String? emailId;
  String? accessToken;
  String? refreshToken;
  String? referralCode;
  User({
    this.userName,
    this.phoneNumber,
    this.password,
    this.emailId,
    this.accessToken,
    this.refreshToken,
    this.referralCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': userName,
      'password': password,
      'email': emailId,
      'number': phoneNumber,
      'company_id':Globals.companyId
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      phoneNumber: map['username'],
      password: map['password'],
      emailId: map['email'],
      accessToken: map['access'],
      refreshToken: map['refresh'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userName: $phoneNumber, password: $password)';
  }
}
