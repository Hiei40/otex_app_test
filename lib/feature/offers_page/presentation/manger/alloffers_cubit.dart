import 'package:bloc/bloc.dart';
import '../../../../utils/database/sqllite_db.dart';

part 'alloffers_state.dart';



class AllOffersCubit extends Cubit<AllOffersState> {
  final DatabaseHelper dbHelper;

  AllOffersCubit(this.dbHelper) : super(AllOffersInitial());

  Future<void> fetchCategories() async {
    try {
      emit(AllOffersLoading());
      final categories = await dbHelper.getCategories();

      if (categories.isEmpty) {
        emit(AllOffersEmpty());
      } else {
        emit(AllOffersLoaded(categories));
      }
    } catch (e) {
      emit(AllOffersError(e.toString()));
    }
  }
}
