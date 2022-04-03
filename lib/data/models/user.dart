import 'dart:convert';

import 'package:fresh/globals/constants/secrets.dart';

class User {
  int? userId;
  String? userName;
  String? phoneNumber;
  String? password;
  String? emailId;
  String? accessToken;
  String? refreshToken;
  String? referralCode;
  String? dateOfBirth;
  String? alternatePhoneNumber;
  String? address;
  String? landMark;
  String? pinCode;
  String? city;
  String? state;
  String? country;
  String? deliveryAddress;
  String? deliveryLandMark;
  String? deliveryPinCode;
  String? deliveryCity;
  String? deliveryState;
  String? deliveryCountry;

  User(
      {this.userId,
      this.userName,
      this.phoneNumber,
      this.password,
      this.emailId,
      this.accessToken,
      this.refreshToken,
      this.referralCode,
      this.address,
      this.alternatePhoneNumber,
      this.city,
      this.country,
      this.dateOfBirth,
      this.deliveryAddress,
      this.deliveryCity,
      this.deliveryCountry,
      this.deliveryLandMark,
      this.deliveryPinCode,
      this.deliveryState,
      this.landMark,
      this.pinCode,
      this.state});

  Map<String, dynamic> toMapLogin() {
    return {
      'username': userName,
      'password': password,
      'email': emailId,
      'number': phoneNumber,
      'company_id': Secrets.companyId
    };
  }

  Map<String, dynamic> toMapProfile() {
    return {
      'userid': userId,
      'email': emailId,
      'dob': dateOfBirth,
      'phone': phoneNumber,
      'alterPhone': alternatePhoneNumber,
      'address': address,
      'landmark': landMark,
      'pincode': pinCode,
      'city': city,
      'state': state,
      'contry': country,
      'daddress': deliveryAddress,
      'dlandmark': deliveryLandMark,
      'dpincode': deliveryPinCode,
      'dcity': deliveryCity,
      'dstate': deliveryState,
      'dcountry': deliveryCountry,
    };
  }

  factory User.fromMapProfile(Map<String, dynamic> map) {
    return User(
      userId: map['userid'],
      emailId: map['email'],
      dateOfBirth: map['dob'],
      phoneNumber: map['phone'],
      alternatePhoneNumber: map['alterPhone'],
      address: map['address'],
      landMark: map['landmark'],
      pinCode: map['pincode'],
      city: map['city'],
      state: map['state'],
      country: map['contry'],
      deliveryAddress: map['daddress'],
      deliveryLandMark: map['dlandmark'],
      deliveryPinCode: map['dpincode'],
      deliveryCity: map['dcity'],
      deliveryState: map['dstate'],
      deliveryCountry: map['dcountry'],
    );
  }

  String toJsonLogin() => json.encode(toMapLogin());

  String toJsonProfile() => json.encode(toMapProfile());

  factory User.fromJsonProfile(String source) =>
      User.fromMapProfile(json.decode(source));

  @override
  String toString() {
    return 'User(userName: $phoneNumber, password: $password)';
  }
}
