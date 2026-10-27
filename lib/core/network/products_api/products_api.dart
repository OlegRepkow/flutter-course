import 'dart:convert';

import 'package:flutter_lab/features/error_handling/data/data_source/models/product_dto.dart';
import 'package:http/http.dart' as http;

abstract interface class ProductsApi {
  Future<List<ProductDTO>> getProducts();
}

class ProductsApiImpl implements ProductsApi {
  @override
  Future<List<ProductDTO>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://onlytarg.github.io/mock_api/products.json'),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;

      final productsList = jsonBody['products'] as List<dynamic>;

      return productsList
          .map((item) => ProductDTO.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch products from API, '
        'status code: ${response.statusCode}',
      );
    }
  }
}
