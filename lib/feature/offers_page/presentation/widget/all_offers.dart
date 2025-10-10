import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/database/sqllite_db.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../search/presentaion/filtering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/alloffers_cubit.dart';

class AllOffers extends StatelessWidget {
  const AllOffers({
    super.key,
    required this.selectedIndex,
    this.onCategorySelected,
  });

  final int selectedIndex;
  final Function(int)? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllOffersCubit(DatabaseHelper())..fetchCategories(),
      child: BlocBuilder<AllOffersCubit, AllOffersState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Filtering(),
                          ),
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
                            const SizedBox(width: 10),
                            Image.asset("assets/arrow_back.png"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  if (state is AllOffersLoading) {
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (state is AllOffersError) {
                    return Center(
                      child: Text('خطأ في تحميل الفئات: ${state.message}'),
                    );
                  } else if (state is AllOffersEmpty) {
                    return const Center(child: Text('لا توجد فئات حالياً'));
                  } else if (state is AllOffersLoaded) {
                    final categories = state.categories;
                    return SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final isSelected = selectedIndex == index;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                onCategorySelected?.call(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                constraints:
                                const BoxConstraints(minWidth: 80),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.red.withOpacity(.05)
                                      : AppColors.white,
                                  border: Border.all(
                                    color: isSelected
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
                                      color: isSelected
                                          ? AppColors.red
                                          : AppColors.textColor
                                          .withOpacity(0.50),
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
                  return const SizedBox();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}


