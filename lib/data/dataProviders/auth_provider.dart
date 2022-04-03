import 'dart:convert';

import 'package:fresh/data/models/user.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  int attemptRefresh = 3;
  Future<String?> login(User user) async {
    String url = Secrets.host + "/api/login/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + user.accessToken!
        },
        body: user.toJsonLogin());
    if (res.statusCode == 201) {
      user.userId = json.decode(res.body)["id"];
      SessionConstants.user = user;
      return "Success";
    } else if (res.statusCode == 401) {
      return "UnAuthorized";
    }
    return null;
  }

  Future<User> signUp(User user) async {
    String url = Secrets.host + "/api/register/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJsonLogin());
    print(res.body);
    if (res.statusCode == 200) {
      user.accessToken = jsonDecode(res.body)['access'];
      user.refreshToken = jsonDecode(res.body)['refresh'];
    }
    /* "{"status":200,"payload":{"id":10,"password":"pbkdf2_sha256$260000$Zvi2pH5juwyDBTHUVgaKC1$bCWwS7LTBdG/jZ8NTYMoxNE50k55C9u8e96BHScA4NM=","last_login":null,"is_superuser":false,"username":"8796440748","first_name":"","last_name":"","email":"","is_staff":false,"is_active":true,"date_joined":"2022-03-20T05:13:38.306734Z","groups":[],"user_permissions":[]},"refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0NzgzOTYxOSwiaWF0IjoxNjQ3NzUzMjE5LCJqdGkiOiJhNzFlMDgxNmJjOGQ0NTA3YmNkZGFmZWVkMjIzYWFmMCIsInVzZXJfaWQiOjEwfQ.jeslduLReWvusDUvwuqOLngEguu49DQ2LJ5NeqLlBM0","access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ3NzUzODE5LCJpYXQiOjE2NDc3NTMyMTksImp0aSI6Ijc2ZWVjMjY3YmI4ZTQzNDlhNmRjODRmOThmZjgwZWEzIiwidXNlcl9pZCI6MTB9.lGHK3AlQ6nmE0cY2aDLzGnj7uvh7h1MXIplgEpp9wkk","message":"Your data is saved"}" */
    return user;
  }

  Future<User?> generateToken(User user) async {
    String url = Secrets.host + "/api/api/token/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "username": user.userName! + Secrets.companyId,
          "password": user.password
        }));
    print(res.body);
    /* "{"status":200,"payload":{"id":10,"password":"pbkdf2_sha256$260000$Zvi2pH5juwyDBTHUVgaKC1$bCWwS7LTBdG/jZ8NTYMoxNE50k55C9u8e96BHScA4NM=","last_login":null,"is_superuser":false,"username":"8796440748","first_name":"","last_name":"","email":"","is_staff":false,"is_active":true,"date_joined":"2022-03-20T05:13:38.306734Z","groups":[],"user_permissions":[]},"refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0NzgzOTYxOSwiaWF0IjoxNjQ3NzUzMjE5LCJqdGkiOiJhNzFlMDgxNmJjOGQ0NTA3YmNkZGFmZWVkMjIzYWFmMCIsInVzZXJfaWQiOjEwfQ.jeslduLReWvusDUvwuqOLngEguu49DQ2LJ5NeqLlBM0","access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ3NzUzODE5LCJpYXQiOjE2NDc3NTMyMTksImp0aSI6Ijc2ZWVjMjY3YmI4ZTQzNDlhNmRjODRmOThmZjgwZWEzIiwidXNlcl9pZCI6MTB9.lGHK3AlQ6nmE0cY2aDLzGnj7uvh7h1MXIplgEpp9wkk","message":"Your data is saved"}" */
    if (res.statusCode == 200) {
      user.accessToken = json.decode(res.body)['access'];
      user.refreshToken = json.decode(res.body)['refresh'];
      return user;
    }
    return null;
  }

  Future<bool> refreshToken() async {
    String url = Secrets.host + "/api/api/token/refresh/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{"refresh": SessionConstants.user.refreshToken}));
    print(res.body);
    if (res.statusCode == 200) {
      SessionConstants.user.accessToken = json.decode(res.body)['access'];
    }
    /* "{"status":200,"payload":{"id":10,"password":"pbkdf2_sha256$260000$Zvi2pH5juwyDBTHUVgaKC1$bCWwS7LTBdG/jZ8NTYMoxNE50k55C9u8e96BHScA4NM=","last_login":null,"is_superuser":false,"username":"8796440748","first_name":"","last_name":"","email":"","is_staff":false,"is_active":true,"date_joined":"2022-03-20T05:13:38.306734Z","groups":[],"user_permissions":[]},"refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0NzgzOTYxOSwiaWF0IjoxNjQ3NzUzMjE5LCJqdGkiOiJhNzFlMDgxNmJjOGQ0NTA3YmNkZGFmZWVkMjIzYWFmMCIsInVzZXJfaWQiOjEwfQ.jeslduLReWvusDUvwuqOLngEguu49DQ2LJ5NeqLlBM0","access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ3NzUzODE5LCJpYXQiOjE2NDc3NTMyMTksImp0aSI6Ijc2ZWVjMjY3YmI4ZTQzNDlhNmRjODRmOThmZjgwZWEzIiwidXNlcl9pZCI6MTB9.lGHK3AlQ6nmE0cY2aDLzGnj7uvh7h1MXIplgEpp9wkk","message":"Your data is saved"}" */
    return res.statusCode == 200;
  }

  Future<bool> changePassword(
      String userName, String oldPassword, String newPassword) async {
    String url = Secrets.host + "/api/changepass/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + SessionConstants.user.accessToken!
        },
        body: jsonEncode(<String, dynamic>{
          "username": userName,
          "oldpass": oldPassword,
          "newpass": newPassword,
          'company_id': Secrets.companyId
        }));
    print(res.body);
    return res.statusCode == 201;
  }

  Future<bool> setPassword(String email, String password) async {
    String url = Secrets.host + "/api/setnewpass/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "email": email.trim(),
          "newpass": password,
          'company_id': Secrets.companyId
        }));
    print(res.body);
    return res.statusCode == 201;
  }

  Future<bool> resetPassword(String email) async {
    String url = Secrets.host + "/api/resetpass/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "email": email.trim(),
          'company_id': Secrets.companyId
        }));
    print(res.body);
    return res.statusCode == 201;
  }

  Future<bool> verifyOtp(String email, String otp) async {
    String url = Secrets.host + "/api/verifyotp/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "email": email.trim(),
          "otp": otp,
          'company_id': Secrets.companyId
        }));
    print(res.body);
    return res.statusCode == 200;
  }
}
