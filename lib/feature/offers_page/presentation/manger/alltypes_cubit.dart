import 'package:bloc/bloc.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../../data/alltype.dart';
part 'alltypes_state.dart';


class AlltypesCubit extends Cubit<AlltypesState> {
  final DatabaseHelper dbHelper;

  AlltypesCubit(this.dbHelper) : super(AlltypesInitial());

  Future<void> fetchAlltypes() async {
    try {
      emit(AlltypesLoading());
      final List<Map<String, dynamic>> maps = await dbHelper.getAlltypes();

      final alltypes = maps.map((map) => Alltypes(
        name: map['name'] as String,
        image: map['image'] as String,
      )).toList();

      if (alltypes.isEmpty) {
        emit(AlltypesEmpty());
      } else {
        emit(AlltypesLoaded(alltypes));
      }
    } catch (e) {
      emit(AlltypesError(e.toString()));
    }
  }
}
