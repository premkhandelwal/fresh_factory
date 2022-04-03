import 'dart:convert';

import 'package:fresh/data/dataProviders/auth_provider.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/data/models/item_details.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  int attemptRefresh = 3;
  Future<List<ItemCategory>?> getItemCategories() async {
    String url = Secrets.host + "/api/getcate/";
    Uri uri = Uri.parse(url);
    var res = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        'Authorization': "Bearer " + SessionConstants.user.accessToken!
      },
      body: jsonEncode(<String, dynamic>{
        "company_id": Secrets.companyId
      })
    );
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
    String url = Secrets.host + "/api/getpro/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SessionConstants.user.accessToken}',
    },
    body: jsonEncode(<String, dynamic>{
        "company_id": Secrets.companyId
      })
    );
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

  Future<ItemDetails?> getProductDetails(String itemId) async {
    String url = Secrets.host + "/api/pro_detail/$itemId";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      // 'Authorization': "Bearer " + SessionConstants.user.accessToken!
    },
    body: jsonEncode(<String, dynamic>{
        "company_id": Secrets.companyId
      })
    );
    if (res.statusCode == 200) {
      attemptRefresh = 3;
      return ItemDetails.fromJson(res.body);
    }
    return null;
  }

  Future<bool> addtoCart(Item item, int quantity) async{
    String url = Secrets.host + "/api/addToCart/";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      'Authorization': "Bearer " + SessionConstants.user.accessToken!
    },
    body: jsonEncode(<String, dynamic>{
        "productId": item.id,
        "customerId": SessionConstants.user.userId,
        "qty": quantity
      })
    );
    return res.statusCode == 200;
  }
}
