import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/fonts/fonts.dart';
import 'minmaxtextform.dart';

class MaxMinWidget extends StatelessWidget {
  const MaxMinWidget({super.key, required this.about, required this.max, required this.min});
final String about;
final String max;
final String min;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                about,
                style: TextStyle(
                  fontFamily: Font.tajwal,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.black.withOpacity(0.4),
                ),
              ),
              Row(children: [


              ],)
            ],
          ),
        ),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Minmaxtextform(hint: min,),
                ),
              ),
              SizedBox(
                width: 50,
              ),

              Expanded(
                flex: 2,
                child: SizedBox(
                  child:Minmaxtextform(hint:max,),
                ),
              ),



            ],
          ),
        ),
      ],

    );
  }
}
