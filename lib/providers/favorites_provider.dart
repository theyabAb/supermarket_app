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


/*import 'package:flutter/foundation.dart';
import '../models/product.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  int get favoritesCount => _favorites.length;

  void toggleFavorite(Product product) {
    if (_favorites.any((p) => p.id == product.id)) {
      _favorites.removeWhere((p) => p.id == product.id);
      product.isFavorite = false;
    } else {
      _favorites.add(product);
      product.isFavorite = true;
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.any((p) => p.id == product.id);
  }

  void removeFromFavorites(Product product) {
    _favorites.removeWhere((p) => p.id == product.id);
    product.isFavorite = false;
    notifyListeners();
  }
}*/