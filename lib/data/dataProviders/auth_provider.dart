import 'package:fresh/data/models/user.dart';
import 'package:fresh/globals/constants/globals.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<String?> login(User user) async {
    String url = Globals.host + "/login/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + user.authToken!
        },
        body: user.toJson());
    if (res.statusCode == 201) {
      return "Success";
    } else if (res.statusCode == 401) {
      return "UnAuthorized";
    }
    return null;
  }

  Future<bool> signUp(User user) async {
    String url = Globals.host + "/register/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson());
    print(res.body);
    /* "{"status":200,"payload":{"id":10,"password":"pbkdf2_sha256$260000$Zvi2pH5juwyDBTHUVgaKC1$bCWwS7LTBdG/jZ8NTYMoxNE50k55C9u8e96BHScA4NM=","last_login":null,"is_superuser":false,"username":"8796440748","first_name":"","last_name":"","email":"","is_staff":false,"is_active":true,"date_joined":"2022-03-20T05:13:38.306734Z","groups":[],"user_permissions":[]},"refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0NzgzOTYxOSwiaWF0IjoxNjQ3NzUzMjE5LCJqdGkiOiJhNzFlMDgxNmJjOGQ0NTA3YmNkZGFmZWVkMjIzYWFmMCIsInVzZXJfaWQiOjEwfQ.jeslduLReWvusDUvwuqOLngEguu49DQ2LJ5NeqLlBM0","access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ3NzUzODE5LCJpYXQiOjE2NDc3NTMyMTksImp0aSI6Ijc2ZWVjMjY3YmI4ZTQzNDlhNmRjODRmOThmZjgwZWEzIiwidXNlcl9pZCI6MTB9.lGHK3AlQ6nmE0cY2aDLzGnj7uvh7h1MXIplgEpp9wkk","message":"Your data is saved"}" */
    return res.statusCode == 200;
  }
}
