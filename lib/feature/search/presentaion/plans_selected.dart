import 'package:flutter/material.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/custom_button.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/packages_views.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/packagestailoredtoyou_widget.dart';
import 'package:otex_app_test/utils/colors/colors.dart';
import 'package:otex_app_test/utils/fonts/fonts.dart';
import 'package:otex_app_test/utils/photos/photos.dart';
import '../../../utils/database/sqllite_db.dart';
import '../data/package_model.dart';


class PlansSelected extends StatefulWidget {
  const PlansSelected({super.key});

  @override
  State<PlansSelected> createState() => _PlansSelectedState();
}

class _PlansSelectedState extends State<PlansSelected> {
  late Future<List<PackageModel>> packagesFuture;

  @override
  void initState() {
    super.initState();
    packagesFuture = DatabaseHelper().getPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(Photos.arrowright),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "أختر الباقات اللى تناسبك",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        fontFamily: Font.tajwal,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: Font.tajwal,
                        color: AppColors.textColor.withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Use FutureBuilder to fetch and display packages from DB
                FutureBuilder<List<PackageModel>>(
                  future: packagesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('خطأ في تحميل الباقات: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final packages = snapshot.data!;
                      return Column(
                        children: packages.map((pkg) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: PackagesViews(
                              ischeck: pkg.isChecked,
                              name: pkg.name,
                              offer: pkg.offer,
                              x: pkg.x,
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(child: Text('لا توجد بيانات'));
                    }
                  },
                ),

                const SizedBox(height: 30),
                const PackagestailoredtoyouWidget(),

                const SizedBox(height: 100),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomButton(
                      textbutton: "التالى",
                      widget: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}