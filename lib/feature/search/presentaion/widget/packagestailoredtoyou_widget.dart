import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';

class PackagestailoredtoyouWidget extends StatelessWidget {
  const PackagestailoredtoyouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return           Container(
      decoration: BoxDecoration(
          color: AppColors.whitecontanier,
          border: Border.all(
            color: AppColors.black.withOpacity(0.10),
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      width: .90*MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
          minHeight: 79
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("باقات مخصصة لك",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.textColor),)


              ],
            ),
            Row(
              children: [
                Text("تواصل معنا لأختيار الباقة المناسبة لك",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.textColor),)


              ],
            ),
            Row(
              children: [
                Text("فريق المبيعات",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.blue),)


              ],
            )
          ],
        ),
      ),
    );
  }
}
