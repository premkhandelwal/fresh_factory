import 'package:fresh/data/models/bank_details.dart';
import 'package:fresh/data/models/user.dart';
import 'package:fresh/globals/constants/globals.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileProvider {
  Future<String?> updateProfileDetails(User user) async {
    String url = Globals.host + "/api/update/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + SessionConstants.user.accessToken!
        },
        body: user.toJsonProfile());
    print(res.body);
    if (res.statusCode == 200) {
      return "Success";
    } else if (res.statusCode == 401) {
      return "UnAuthorized";
    }
    return null;
  }

  Future<String?> updateBankDetails(
    BankDetails bankDetails,
  ) async {
    // create multipart request

    // multipart that takes file

    // add file to multipart

    // send

    String url = Globals.host + "/api/update/";
    Uri uri = Uri.parse(url);
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer " + SessionConstants.user.accessToken!
    });
    if (bankDetails.panCard != null) {
      var multipartFile = new http.MultipartFile(
        'file1',
        bankDetails.panCard!.stream,
        bankDetails.panCard!.length,
      );
      request.files.add(multipartFile);
    }
    if (bankDetails.gst != null) {
      var multipartFile = new http.MultipartFile(
        'file2',
        bankDetails.gst!.stream,
        bankDetails.gst!.length,
      );
      request.files.add(multipartFile);
    }
    if (bankDetails.bankCheque != null) {
      var multipartFile = new http.MultipartFile(
        'file3',
        bankDetails.bankCheque!.stream,
        bankDetails.bankCheque!.length,
      );
      request.files.add(multipartFile);
    }
    request.fields.addAll(bankDetails.toMap());
    var response = await request.send();
    // print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    /*  if (res.statusCode == 200) {
      return "Success";
    } else if (res.statusCode == 401) {
      return "UnAuthorized";
    } */
    return "";
  }
}
