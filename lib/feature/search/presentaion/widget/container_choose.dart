import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';



class ContainerChoose extends StatelessWidget {
  const ContainerChoose({
    super.key,
    required this.isSelect,
    required this.option,
    required this.onTap,
  });

  final bool isSelect;
  final String option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 40, minWidth: 40, maxWidth: 120),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelect ? AppColors.blue : AppColors.black.withOpacity(0.10),
            width: isSelect ? 3.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          " $option ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelect
                ? AppColors.blue
                : AppColors.textColor.withOpacity(0.50),
          ),
        ),
      ),
    );
  }
}
