import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => [..._favoriteProducts];

  void toggleFavorite(Product product) {
    if (_favoriteProducts.any((p) => p.id == product.id)) {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.any((p) => p.id == product.id);
  }

  void removeFromFavorites(String productId) {
    _favoriteProducts.removeWhere((p) => p.id == productId);
    notifyListeners();
  }
}


