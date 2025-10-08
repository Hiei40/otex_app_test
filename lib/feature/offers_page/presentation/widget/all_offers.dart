import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../search/presentaion/filtering.dart';


class AllOffers extends StatefulWidget {
  const AllOffers({super.key, required this.selectedIndex, this.onCategorySelected});
  final int selectedIndex;
  final Function(int)? onCategorySelected;

  @override
  State<AllOffers> createState() => _AllOffersState();
}

class _AllOffersState extends State<AllOffers> {
  late Future<List<String>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = DatabaseHelper().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 18.0),
          child: Row(
            children: [
              Text(
                "أستكشف العروض",
                style: TextStyle(
                  fontFamily: Font.tajwal,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Filtering()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "الكل",
                        style: TextStyle(
                          fontFamily: Font.tajwal,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.black.withOpacity(0.50),
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset("assets/arrow_back.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        FutureBuilder<List<String>>(
          future: _categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            } else if (snapshot.hasError) {
              return Text('خطأ في تحميل الفئات: ${snapshot.error}');
            } else {
              final categories = snapshot.data ?? [];
              return SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                          });
                          widget.onCategorySelected?.call(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minWidth: 80),
                          decoration: BoxDecoration(
                            color: widget.selectedIndex == index
                                ? AppColors.red.withOpacity(.05)
                                : AppColors.white,
                            border: Border.all(
                              color: widget.selectedIndex == index
                                  ? AppColors.bluelight.withOpacity(0.10)
                                  : AppColors.black.withOpacity(0.10),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: widget.selectedIndex == index
                                    ? AppColors.red
                                    : AppColors.textColor.withOpacity(0.50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}




