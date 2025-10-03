import 'package:flutter/cupertino.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/photos/photos.dart';
import '../../data/alltype.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: constalltype.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    minWidth: 80, // عرض مناسب للزر
                  ),
                  decoration: BoxDecoration(color: AppColors.white),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          constalltype[index].image,
                          fit: BoxFit.contain,
                          width: 50,
                          height: 50,
                        ),

                        Text(
                          constalltype[index].name,
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
            },
          ),
        ),

        Container(
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
        ),
      ],
    );
  }
}
