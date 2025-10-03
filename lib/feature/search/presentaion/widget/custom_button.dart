import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/fonts/fonts.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textbutton, this.widget});

  final String textbutton;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textbutton,
              style: TextStyle(
                fontFamily: Font.tajwal,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            if (widget != null) Directionality(textDirection: TextDirection.ltr,
            child: widget!),

          ],
        ),
      ),
    );
  }
}