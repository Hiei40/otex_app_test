import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/photos/photos.dart';

class FreeDelivery extends StatelessWidget {
  const FreeDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return         Container(
      width: MediaQuery.of(context).size.width * .90,
      color: AppColors.red.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(Photos.check),
            SizedBox(width: 10),
            Text(
              "شحن مجانى",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: Font.tajwal,
                color: AppColors.green,
              ),
            ),
            Spacer(),
            Text(
              "لأى عرض تطلبه دلوقتى !",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: Font.tajwal,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
