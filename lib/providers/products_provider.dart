import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'خبز أسمر طازج',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png',
      price: 1.50,
      category: 'مخبوزات',
    ),
    Product(
      id: '2',
      name: 'حليب كامل الدسم',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3196/3196474.png',
      price: 2.00,
      category: 'ألبان',
    ),
    Product(
      id: '3',
      name: 'جبنة بيضاء',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1998/1998629.png',
      price: 3.25,
      category: 'ألبان',
    ),
    Product(
      id: '4',
      name: 'زيت زيتون بكر',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3048/3048551.png',
      price: 5.99,
      category: 'زيوت',
    ),
    Product(
      id: '5',
      name: 'تفاح أحمر سكري',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/415/415682.png',
      price: 1.20,
      category: 'فواكه',
    ),
    Product(
      id: '6',
      name: 'موز طازج',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/344/344907.png',
      price: 1.80,
      category: 'فواكه',
    ),
    Product(
      id: '7',
      name: 'دجاج طازج',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1369/1369529.png',
      price: 7.50,
      category: 'لحوم',
    ),
    Product(
      id: '8',
      name: 'بيض أحمر',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1254/1254337.png',
      price: 2.50,
      category: 'بيض',
    ),
    Product(
      id: '9',
      name: 'خيار طازج',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1052/1052732.png',
      price: 1.00,
      category: 'خضروات',
    ),
    Product(
      id: '10',
      name: 'طماطم',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1013/1013132.png',
      price: 1.20,
      category: 'خضروات',
    ),
    Product(
      id: '11',
      name: 'عصير برتقال',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1143/1143494.png',
      price: 2.50,
      category: 'مشروبات',
    ),
    Product(
      id: '12',
      name: 'تونة معلبة',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3064/3064856.png',
      price: 3.00,
      category: 'معلبات',
    ),
  ];

  List<Product> get products => [..._products];

  List<Product> get favoriteProducts =>
      _products.where((product) => product.isFavorite).toList();

  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }

  void toggleFavorite(String productId) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      _products[index].isFavorite = !_products[index].isFavorite;
      notifyListeners();
    }
  }
}