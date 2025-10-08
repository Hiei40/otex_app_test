import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';

class PackagesWidget extends StatelessWidget {
  const PackagesWidget({super.key, required this.image, required this.name,});
final String image;
final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minWidth: 80,
        ),
        decoration: BoxDecoration(color: AppColors.white),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
            image,                          fit: BoxFit.contain,

              ),

              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
