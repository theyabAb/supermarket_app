import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import 'category_products_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'مخبوزات', 'icon': Icons.bakery_dining, 'color': Colors.orange},
    {'name': 'ألبان', 'icon': Icons.egg, 'color': Colors.blue},
    {'name': 'زيوت', 'icon': Icons.oil_barrel, 'color': Colors.green},
    {'name': 'فواكه', 'icon': Icons.apple, 'color': Colors.red},
    {'name': 'لحوم', 'icon': Icons.ramen_dining, 'color': Colors.brown},
    {'name': 'خضروات', 'icon': Icons.eco, 'color': Colors.lightGreen},
    {'name': 'مشروبات', 'icon': Icons.local_drink, 'color': Colors.cyan},
    {'name': 'معلبات', 'icon': Icons.kitchen, 'color': Colors.deepOrange},
  ];

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('الفئات'), backgroundColor: Colors.green),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, i) {
          final category = categories[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CategoryProductsScreen(categoryName: category['name']),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: category['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: category['color'].withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category['icon'], size: 50, color: category['color']),
                  SizedBox(height: 12),
                  Text(
                    category['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: category['color'],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${productsProvider.getProductsByCategory(category['name']).length} منتج',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
