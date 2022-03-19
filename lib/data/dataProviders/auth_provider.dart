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
    if (res.statusCode == 200) {
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
    return res.statusCode == 200;
  }
}
