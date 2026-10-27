import 'package:flutter_lab/features/error_handling/data/repository/entities/product_entity.dart';

class ProductsState {
  const ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
  });

  const ProductsState.initial()
    : status = ProductsStatus.loading,
      products = const [],
      errorMessage = null;

  final ProductsStatus status;
  final List<ProductEntity> products;
  final String? errorMessage;

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductEntity>? products,
    String? errorMessage,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum ProductsStatus { initial, loading, loaded, error }
