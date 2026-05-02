class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.isFavorite = false,
  });
}



// lib/models/product.dart
/*class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.category = 'General',
    this.isFavorite = false,
  });
}*/