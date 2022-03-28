import 'dart:convert';

import 'package:fresh/data/models/image_to_file_api.dart';

class BankDetails {
  int? customerId;
  String customerName;
  String phoneNumber;
  CustomFile? panCard;
  CustomFile? gst;
  String bankName;
  String accountNumber;
  CustomFile? bankCheque;
  String upiNumber;
  BankDetails({
    required this.customerId,
    this.customerName = "",
    this.phoneNumber = "",
    this.panCard,
    this.gst,
    this.bankName = "",
    this.accountNumber = "",
    this.bankCheque,
    this.upiNumber = "",
  });

    Map<String, String> toMap() {
    return {
      'customerId': customerId.toString(),
      'accName': customerName,
      'phoneNumber': phoneNumber,      
      'bankName': bankName,
      'accNumber': accountNumber,
      'upiNumber': upiNumber,
    };
  }

  factory BankDetails.fromMap(Map<String, dynamic> map) {
    return BankDetails(
      customerId: map['customerId'] ?? '',
      customerName: map['accountName'],
      phoneNumber: map['phoneNumber'],
      panCard: map['panCard'],
      gst: map['gst'],
      bankName: map['bankName'],
      accountNumber: map['accountNumber'],
      bankCheque: map['bankCheque'],
      upiNumber: map['upiNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BankDetails.fromJson(String source) => BankDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BankDetails(customerId: $customerId, accountName: $customerName, phoneNumber: $phoneNumber, panCard: $panCard, gst: $gst, bankName: $bankName, accountNumber: $accountNumber, bankCheque: $bankCheque, upiNumber: $upiNumber)';
  }
}
