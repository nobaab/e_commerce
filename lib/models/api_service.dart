import 'dart:convert';

import 'package:http/http.dart';

import 'products_model.dart';

class ProductsRepository {
  String baseUrl =
      "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice";

  Future<List<ProductModel>> getProducts() async {
    Response response = await get(Uri.parse(baseUrl));

    try {
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result
            .map(((e) => ProductModel.fromJson(e)))
            .toList(); // <--change this
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      //throw Exception(response.reasonPhrase);
      print(e.toString());
    }
    return [];
  }
}
