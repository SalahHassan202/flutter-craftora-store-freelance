class ProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final bool isFavorite;
  final String description;
  final List<String> features;
  final List<String> imageUrls;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFavorite = false,
    this.description = '',
    this.features = const [],
    this.imageUrls = const [],
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}
