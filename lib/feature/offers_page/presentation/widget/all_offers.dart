import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/const.dart';
import '../../../../utils/const/search_textformfield.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/photos/photos.dart';
import '../../../search/presentaion/filtering.dart';

class AllOffers extends StatelessWidget {
  const AllOffers({super.key, required this.selectedIndex});
final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Filtering()),
            );
          },
         child:  Container(

           child: Row(
             children: [
               Spacer(),

               Image.asset(Photos.arrowright),

               Spacer(),
               SearchTextformfield(hint: 'أبحث فى العروض'),

               Spacer(),
             ],
           ),
         ),

        ),


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
                  Padding(
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
                ],
              ),
            ),

            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: alloffers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(
                        minWidth: 80,
                      ),
                      decoration: BoxDecoration(
                        color:
                        selectedIndex == index
                            ? AppColors.red.withOpacity(.05)
                            : AppColors.white,
                        border: Border.all(
                          color:
                          selectedIndex == index
                              ? AppColors.bluelight.withOpacity(0.10)
                              : AppColors.black.withOpacity(0.10),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          alloffers[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color:
                            selectedIndex == index
                                ? AppColors.red
                                : AppColors.textColor.withOpacity(0.50),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],


    );
  }
}
