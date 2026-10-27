import 'package:flutter_lab/core/network/products_api/products_api.dart';
import 'package:flutter_lab/features/error_handling/data/data_source/models/product_dto.dart';

abstract interface class ProductsDataSource {
  Future<List<ProductDTO>> getProducts();
}

class ProductsDataSourceImpl implements ProductsDataSource {
  ProductsDataSourceImpl(this._api);

  final ProductsApi _api;

  @override
  Future<List<ProductDTO>> getProducts() async {
    final result = await _api.getProducts();

    return result;
  }
}
