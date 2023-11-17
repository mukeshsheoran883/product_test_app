import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_test_app/model/product_model.dart';
import 'package:product_test_app/model/product_response.dart';
import 'package:product_test_app/utili/api_end_point.dart';

class ProductApi{
  Future<List<ProductModel>> getProduct() async {
    String url = ApiEndPoint.product;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      String body = response.body;
      final data = jsonDecode(body);
      ProductResponse productResponse = ProductResponse.fromJson(data);
      return productResponse.products;
    } else {
      throw 'Something went wrong';
    }
  }
}