import 'package:flutter/cupertino.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/product_card.dart';

import '../../../../utils/database/sqllite_db.dart';
import '../../data/product_model.dart';

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products available'));
        }

        final productList = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.5,
            ),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: productList[index]);
            },
          ),
        );
      },
    );
  }

  Future<List<ProductModel>> _fetchProducts() async {
    final dbHelper = DatabaseHelper();
    final List<Map<String, dynamic>> maps = await dbHelper.getProducts();
    return maps.map((map) => ProductModel(
      name: map['name'] as String,
      image: map['image_url'] as String,
      price: (map['price'] as num).toDouble(),
      oldPrice: map['old_price'] != null ? (map['old_price'] as num).toDouble() : null,
      soldCount: map['sold_count'] as int? ?? 0,
      storeImage: map['store_image'] as String?,
    )).toList();
  }
}