import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../../data/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {

  final DatabaseHelper dbHelper;

  ProductCubit(this.dbHelper) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final List<Map<String, dynamic>> maps = await dbHelper.getProducts();

      final products = maps.map((map) => ProductModel(
        name: map['name'] as String,
        image: map['image_url'] as String,
        price: (map['price'] as num).toDouble(),
        oldPrice: map['old_price'] != null ? (map['old_price'] as num).toDouble() : null,
        soldCount: map['sold_count'] as int? ?? 0,
        storeImage: map['store_image'] as String?,
      )).toList();

      if (products.isEmpty) {
        emit(ProductEmpty());
      } else {
        emit(ProductLoaded(products));
      }
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
