import 'package:flutter/cupertino.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/packages_widget.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../../data/alltype.dart';
import 'free_delivery.dart';



class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: FutureBuilder<List<Alltypes>>(
            future: _fetchAlltypes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              }

              final alltypes = snapshot.data!;
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
            },
          ),
        ),
        const FreeDelivery(),
      ],
    );
  }

  Future<List<Alltypes>> _fetchAlltypes() async {
    final dbHelper = DatabaseHelper();
    final List<Map<String, dynamic>> maps = await dbHelper.getAlltypes();
    return maps.map((map) => Alltypes(
      name: map['name'] as String,
      image: map['image'] as String,
    )).toList();
  }
}