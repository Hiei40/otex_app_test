import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/fonts/fonts.dart';




class ListTileCustomPackage extends StatelessWidget {
  const ListTileCustomPackage({
    super.key,
    required this.title,
    this.subtitle,
    required this.image,
  });

  final String title;
  final String? subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading Image
        Image.asset(
          image,
          width: 22,
          height: 22,
        ),
        const SizedBox(width: 12), // spacing between image and text
        // Texts (title & optional subtitle)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: Font.tajwal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.textColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    subtitle!,
                    style: TextStyle(
                      fontFamily: Font.tajwal,
                      fontSize: 12,
                      color: AppColors.red,

                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
