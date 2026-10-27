class ProductDTO {
  const ProductDTO({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  ProductDTO.fromJson(Map<String, dynamic> json)
    : title = json['title'] as String,
      price = json['price'] as String,
      imageUrl = json['imageUrl'] as String;

  final String title;
  final String price;
  final String imageUrl;
}
