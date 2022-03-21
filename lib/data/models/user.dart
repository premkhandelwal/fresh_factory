import 'dart:convert';

class User {
  String? userName;
  String? phoneNumber;
  String? password;
  String? accessToken;
  String? refreshToken;
  String? referralCode;
  User({
    this.phoneNumber,
    this.password,
    this.accessToken,
    this.refreshToken,
    this.referralCode,
  });


  Map<String, dynamic> toMap() {
    return {
      'username': phoneNumber,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      phoneNumber: map['username'],
      password: map['password'],
      accessToken: map['access'],
      refreshToken: map['refresh'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userName: $phoneNumber, password: $password, authToken: $accessToken, refreshToken: $refreshToken)';
  }
}
