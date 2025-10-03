import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';

class Containericon extends StatelessWidget {
  final String iconPath;
  final String label;

  const Containericon({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xff090F1F),
            width: 2.0,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Spacer(),
          const SizedBox(height: 9),
          Image.asset(
            iconPath,
            color: AppColors.textColor,
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 7),
          const Spacer(),
        ],
      ),
    );
  }
}
