import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';

class SemicircleNumberWidget extends StatelessWidget {
  const SemicircleNumberWidget({super.key, required this.x});
  final int x;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Stack(
        children: [
          ClipPath(
            child: Container(
              width: double.infinity,
              height: double.infinity,

              decoration: BoxDecoration(
                color: AppColors.green.withOpacity(0.05),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                border: Border(
                  left: BorderSide(color: AppColors.green, width: 2),
                  top: BorderSide(color: AppColors.green, width: 2),
                  right: BorderSide(color: AppColors.green, width: 2),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              x.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
