import 'package:fresh/data/dataProviders/auth_provider.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/constants/globals.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  int attemptRefresh = 3;
  Future<List<ItemCategory>?> getItemCategories() async {
    String url = Globals.host + "/api/getcate/";
    Uri uri = Uri.parse(url);
    var res = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SessionConstants.user.accessToken}',
    });
    if (res.statusCode == 200) {
      attemptRefresh = 3;
      return ItemCategory.fromJsonList(res.body);
    } else if (res.statusCode == 401) {
      if (attemptRefresh == 0) {
        attemptRefresh = 3;
        return [];
      }
      bool refreshToken = await AuthProvider().refreshToken();
      if (!refreshToken) {
        attemptRefresh -= 1;
      }
        getItemCategories();
    }
    attemptRefresh = 3;
    return null;
  }
  Future<List<Item>?> getProducts() async {
    String url = Globals.host + "/api/getpro/";
    Uri uri = Uri.parse(url);
    var res = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SessionConstants.user.accessToken}',
    });
    if (res.statusCode == 200) {
      attemptRefresh = 3;
      return Item.fromJsonList(res.body);
    } else if (res.statusCode == 401) {
      if (attemptRefresh == 0) {
        attemptRefresh = 3;
        return [];
      }
      bool refreshToken = await AuthProvider().refreshToken();
      if (!refreshToken) {
        attemptRefresh -= 1;
      }
        getItemCategories();
    }
    attemptRefresh = 3;
    return null;
  }
}
