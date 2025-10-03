import 'package:flutter/material.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/const/search_textformfield.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/photos/photos.dart';
import '../data/city.dart';

class FindMyLocationPage extends StatefulWidget {
  const FindMyLocationPage({super.key});

  @override
  State<FindMyLocationPage> createState() => _FindMyLocationPageState();
}

class _FindMyLocationPageState extends State<FindMyLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Image.asset(Photos.closesmall),

                  Text(
                    'المواقع',
                    style: TextStyle(
                      fontFamily: Font.tajwal,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  SearchTextformfield(hint: 'ابحث في مصر'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "حذف",
                      style: TextStyle(
                        fontFamily: Font.tajwal,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(Photos.mylocation),

                    Text(
                      'حدد موقعك الحالى وأستخدمه',
                      style: TextStyle(
                        fontFamily: Font.tajwal,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'عمليات البحث الأخيرة',
                      style: TextStyle(
                        fontFamily: Font.tajwal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        trailing: Image.asset(Photos.iosarrow),
                        title: Text(
                          "${cityyousearchabout[index].city}, ${cityyousearchabout[index].government}",
                          style: TextStyle(
                            fontFamily: Font.tajwal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          height: 1.5,
                          width: double.infinity,
                          color: AppColors.textColor.withOpacity(0.10),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: cityyousearchabout.length,
                shrinkWrap: true,
              ),
              SizedBox(height: 10),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'المناطق المتاحة',
                      style: TextStyle(
                        fontFamily: Font.tajwal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        trailing: Image.asset(Photos.iosarrow),
                        title: Text(
                          "${avalibalecites[index].city}, ${avalibalecites[index].government}",
                          style: TextStyle(
                            fontFamily: Font.tajwal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          height: 1.5,
                          width: double.infinity,
                          color: AppColors.textColor.withOpacity(0.10),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: avalibalecites.length,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
