import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';
import '../providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              favoritesProvider.isFavorite(product) ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              favoritesProvider.toggleFavorite(product);
              productsProvider.toggleFavorite(product.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // صورة المنتج
            Container(
              height: 300,
              color: Colors.grey.shade100,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            
            // معلومات المنتج
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المنتج
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  
                  // الفئة
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product.category,
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // السعر
                  Row(
                    children: [
                      Text(
                        'السعر: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  // وصف المنتج (وهمي)
                  Text(
                    'وصف المنتج',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'منتج عالي الجودة من سوبرماركت المنار. يتميز بجودة ممتازة وسعر مناسب. متوفر بكميات محدودة، احصل عليه الآن!',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  // معلومات إضافية
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildInfoRow('العلامة التجارية', 'سوبرماركت المنار'),
                        _buildInfoRow('بلد المنشأ', 'السعودية'),
                        _buildInfoRow('الوزن', '1 كجم'),
                        _buildInfoRow('الضمان', 'سنة كاملة'),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  // أزرار الإضافة إلى السلة والمفضلة
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            cartProvider.addToCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('✓ تمت إضافة ${product.name} إلى السلة'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          label: Text(
                            'أضف إلى السلة',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: favoritesProvider.isFavorite(product)
                              ? Colors.red.withOpacity(0.1)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: Icon(
                            favoritesProvider.isFavorite(product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favoritesProvider.isFavorite(product)
                                ? Colors.red
                                : Colors.grey,
                            size: 28,
                          ),
                          onPressed: () {
                            favoritesProvider.toggleFavorite(product);
                            productsProvider.toggleFavorite(product.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  favoritesProvider.isFavorite(product)
                                      ? '✓ تمت إضافة ${product.name} إلى المفضلة'
                                      : '✓ تمت إزالة ${product.name} من المفضلة',
                                ),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}