import 'package:flutter_lab/features/error_handling/data/data_source/products_data_source.dart';
import 'package:flutter_lab/features/error_handling/data/repository/entities/product_entity.dart';

abstract interface class ProductsRepository {
  Future<List<ProductEntity>> getProducts();
}

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl(this._dataSource);

  final ProductsDataSource _dataSource;

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await _dataSource.getProducts();

    final result = response.map(ProductEntity.fromDTO).toList();

    return result;
  }
}
