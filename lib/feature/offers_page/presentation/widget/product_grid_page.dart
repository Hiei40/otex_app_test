import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/product_card.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../manger/product_cubit.dart';

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(DatabaseHelper())..fetchProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is ProductEmpty) {
            return const Center(child: Text('No products available'));
          } else if (state is ProductLoaded) {
            final productList = state.products;
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
          }
          return const SizedBox();
        },
      ),
    );
  }
}
