import 'package:flutter/cupertino.dart';

import '../../../../utils/photos/photos.dart';
import 'list_tile_custom_package.dart';

class PackageWidget extends StatelessWidget {
  final String name;

  const PackageWidget({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    if (name != 'أساسية') {
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(height: 10),
          ListTileCustomPackage(
            title: "رفع لأعلى القائمة كل 3 أيام",
            image: Photos.rocket,
          ),
          SizedBox(height: 10),
          ListTileCustomPackage(
            title: "تثبيت فى مقاول صحى",
            subtitle: "( خلال ال48 ساعة القادمة )",
            image: Photos.keep,
          ),

          SizedBox(height: 10),
          name != "أكسترا"
              ? Column(
            children: [
              SizedBox(height: 10),
              ListTileCustomPackage(
                title: "ظهور فى كل محافظات مصر",
                image: Photos.globle, // Corrected typo
              ),

              SizedBox(height: 10),
              ListTileCustomPackage(
                title: "أعلان مميز",
                image: Photos.workspace,
              ),

              SizedBox(height: 10),
              ListTileCustomPackage(
                title: "تثبيت فى مقاول صحى فى الجهراء",
                image: Photos.keep,
              ),
              SizedBox(height: 10),
              ListTileCustomPackage(
                title: "تثبيت فى مقاول صحى",
                subtitle: "( خلال ال48 ساعة القادمة )",
                image: Photos.keep,
              ),
              SizedBox(height: 10),
            ],
          )
              : SizedBox(),
        ],
      );
    }
    return const SizedBox(); // Fallback if condition is not met
  }
}
