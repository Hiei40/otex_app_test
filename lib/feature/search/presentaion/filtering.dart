import 'package:flutter/material.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/container_choose.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/custom_button.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/max_min_widget.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/const.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/photos/photos.dart';
import 'findmy_location.dart';


class Filtering extends StatefulWidget {
  const Filtering({super.key});

  @override
  State<Filtering> createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  String selected = "الكل";
  String numbofrooms = "الكل";
  String paymentway = "تقسيط";
  String buildingstatus = "جاهز";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(Photos.closesmall),
                      const SizedBox(width: 8),
                      Text(
                        'فلترة',
                        style: TextStyle(
                          fontFamily: Font.tajwal,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: AppColors.textColor,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = "الكل";
                            numbofrooms = "الكل";
                            paymentway = "تقسيط";
                            buildingstatus = "جاهز";
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          'رجوع للأفتراضى',
                          style: TextStyle(
                            fontFamily: Font.tajwal,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الفئة',
                        style: TextStyle(
                          fontFamily: Font.tajwal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black.withOpacity(0.4),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(Photos.realstate),
                        title: Text(
                          "عقارات",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                        subtitle: Text(
                          "فلل البيع",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        trailing: Text(
                          "تغيير",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.bluelight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 5),

                GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FindMyLocationPage()),
                );
              },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(Photos.locationon),
                      title: Text(
                        "الموقع",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                      subtitle: Text(
                        "مصر",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      trailing: Image.asset(Photos.iosarrow),
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 30),

                MaxMinWidget(about: 'الأقساط الشهرية', max: '', min: ''),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'النوع',
                    style: TextStyle(
                      fontFamily: Font.tajwal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 10.0,
                    children: List.generate(options.length, (index) {
                      final option = options[index];
                      final bool isSelected = selected == option;

                      return IntrinsicWidth(
                        child: ContainerChoose(
                          option: option,
                          isSelect: isSelected,
                          onTap: () {
                            setState(() {
                              selected = option;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'عدد الغرف',
                    style: TextStyle(
                      fontFamily: Font.tajwal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 3.0,
                    children: numofrooms.map((option) {
                      final bool isSelected = numbofrooms == option;
                      return IntrinsicWidth(
                        child: ContainerChoose(
                          isSelect: isSelected,
                          option: option,
                          onTap: () {
                            setState(() {
                              numbofrooms = option;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),

                MaxMinWidget(about: 'السعر', max: 'أقصى سعر', min: 'أقل سعر'),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'طريقة الدفع',
                    style: TextStyle(
                      fontFamily: Font.tajwal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 3.0,
                    children: paymentways.map((option) {
                      final bool isSelected = paymentway == option;
                      return IntrinsicWidth(
                        child: ContainerChoose(
                          isSelect: isSelected,
                          option: option,
                          onTap: () {
                            setState(() {
                              paymentway = option;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'حالة العقار',
                    style: TextStyle(
                      fontFamily: Font.tajwal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),

                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 3.0,
                    children: aboutbuilding.map((option) {
                      final bool isSelected = buildingstatus == option;
                      return IntrinsicWidth(
                        child: ContainerChoose(
                          isSelect: isSelected,
                          option: option,
                          onTap: () {
                            setState(() {
                              buildingstatus = option;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                    },
                    child:CustomButton(textbutton: "شاهد 10,000+ نتائج",),
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
