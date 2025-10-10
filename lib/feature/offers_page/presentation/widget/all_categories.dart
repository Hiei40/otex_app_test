import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/packages_widget.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../manger/alltypes_cubit.dart';
import 'free_delivery.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlltypesCubit(DatabaseHelper())..fetchAlltypes(),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: BlocBuilder<AlltypesCubit, AlltypesState>(
              builder: (context, state) {
                if (state is AlltypesLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is AlltypesError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is AlltypesEmpty) {
                  return const Center(child: Text('No data available'));
                } else if (state is AlltypesLoaded) {
                  final alltypes = state.alltypes;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: alltypes.length,
                    itemBuilder: (context, index) {
                      return PackagesWidget(
                        image: alltypes[index].image,
                        name: alltypes[index].name,
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          const FreeDelivery(),
        ],
      ),
    );
  }
}
