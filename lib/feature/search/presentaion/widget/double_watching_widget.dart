import 'package:flutter/cupertino.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/packages_views.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/semicircle_number_widget.dart';

import '../../../../utils/colors/colors.dart';

class Doublewatchingwidget extends StatelessWidget {
  const Doublewatchingwidget({super.key, required this.x});
  final int x;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,

            child: SemicircleNumberWidget(x: x),
          ),
          Text(
            "ضعف عدد \nالمشاهدات",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              decorationColor: AppColors.green,
              decorationThickness: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.textColor,
              decoration: TextDecoration.underline,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
