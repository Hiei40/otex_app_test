import 'package:flutter/material.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/custom_button.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/packages_views.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/packagestailoredtoyou_widget.dart';
import 'package:otex_app_test/utils/colors/colors.dart';
import 'package:otex_app_test/utils/fonts/fonts.dart';
import 'package:otex_app_test/utils/photos/photos.dart';

class PlansSelected extends StatefulWidget {
  const PlansSelected({super.key});

  @override
  State<PlansSelected> createState() => _PlansSelectedState();
}

class _PlansSelectedState extends State<PlansSelected> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  SizedBox(width: 10),
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
                  SizedBox(width: 10),
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
              SizedBox(height: 30),
              PackagesViews(ischeck: isChecked, name: 'أساسية',),
               SizedBox(height: 10,),
              PackagesViews(ischeck: isChecked, name: 'أكسترا',),              SizedBox(height: 30),
              PackagesViews(ischeck: isChecked, name: 'بلس',offer:"أفضل قيمة مقابل سعر",),  SizedBox(height: 30),
              PackagesViews(ischeck: isChecked, name: 'سوبر',offer:"أعلى مشاهدات"),
              SizedBox(height: 30),
              PackagestailoredtoyouWidget(),

              const SizedBox(height: 100),

              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                  },
                  child:CustomButton(textbutton: "التالى",widget:Icon(Icons.arrow_back,color: Colors.white,) ,),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
