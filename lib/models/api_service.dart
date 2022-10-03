import 'dart:convert';

import 'package:http/http.dart' as http;

import 'products_model.dart';

class ProductsRepository {
  String baseUrl =
      "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice";

  Future<ProductModel> getProducts() async {
    // Response response = await get(Uri.parse(baseUrl));

    // try {
    //   if (response.statusCode == 200) {
    //     final List result = jsonDecode(response.body)['data'];
    //     return result
    //         .map(((e) => ProductModel.fromJson(e)))
    //         .toList(); // <--change this
    //   } else {
    //     throw Exception(response.reasonPhrase);
    //   }
    // } catch (e) {
    //   //throw Exception(response.reasonPhrase);
    //   print(e.toString());
    // }
    // return [];

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonObj = jsonDecode(response.body);
        final data = ProductModel.fromJson(jsonObj);
        return data;
      } else {
        throw Exception("Failed to load data !");
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
