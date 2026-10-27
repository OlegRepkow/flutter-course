import 'package:flutter_lab/features/error_handling/data/data_source/models/product_dto.dart';

class ProductEntity {
  const ProductEntity({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  factory ProductEntity.fromDTO(ProductDTO dto) {
    return ProductEntity(
      title: dto.title,
      price: dto.price,
      imageUrl: dto.imageUrl,
    );
  }

  final String title;
  final String price;
  final String imageUrl;
}
