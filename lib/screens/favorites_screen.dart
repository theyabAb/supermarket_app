import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../providers/products_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(title: Text('المفضلة'), backgroundColor: Colors.green),
      body: favoritesProvider.favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'لا توجد منتجات في المفضلة',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'أضف منتجاتك المفضلة بالضغط على أيقونة القلب',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: favoritesProvider.favoriteProducts.length,
              itemBuilder: (ctx, i) {
                final product = favoritesProvider.favoriteProducts[i];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${product.price.toStringAsFixed(2)}  •  ${product.category}',
                      style: TextStyle(color: Colors.green.shade700),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red, size: 28),
                      onPressed: () {
                        favoritesProvider.removeFromFavorites(product.id);
                        productsProvider.toggleFavorite(product.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تمت إزالة ${product.name} من المفضلة',
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
