import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/photos/photos.dart';
import 'list_tile_custom_package.dart';

class PackagesViews extends StatefulWidget {
  final bool ischeck;
  final String name;
  final String? offer;

  const PackagesViews({
    super.key,
    required this.ischeck,
    required this.name,
    this.offer,
  });

  @override
  State<PackagesViews> createState() => _PackagesViewsState();
}

class _PackagesViewsState extends State<PackagesViews> {
  late bool ischeck;

  @override
  void initState() {
    super.initState();
    ischeck = widget.ischeck;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          children: [
            SizedBox(height: 12),
            Container(

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF090F1F).withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: AppColors.white,
                border: Border.all(color: AppColors.black.withOpacity(0.10)),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              constraints: const BoxConstraints(minHeight: 79),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.bluelight,
                              checkColor: Colors.white,
                              value: ischeck,
                              onChanged: (bool? value) {
                                setState(() {
                                  ischeck = value!;
                                });
                              },
                            ),
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color:
                                    ischeck
                                        ? AppColors.bluelight
                                        : AppColors.textColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "3,000ج.م",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.red,
                                decorationThickness: 30,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                    .50 * MediaQuery.of(context).size.width,
                                child: Column(
                                  spacing: 10,
                                  children: [
                                    ListTileCustomPackage(
                                      title: "صلاحية الأعلان 30 يوم",
                                      image: Photos.clock,
                                    ),
                                    PackageWidget(name: widget.name),
                                  ],
                                ),
                              ),
                              Spacer(),
                              widget.name == 'أساسية'
                                  ? SizedBox()
                                  : Doublewatchingwidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        widget.offer != null
            ? Positioned(
              top: 0,
              child: ClipPath(
                clipper: BannerClipper(),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 25,
                    minWidth: 60,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orangelight,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "  ${widget.offer.toString()}    ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.redldark,
                      ),
                    ),
                  ),
                ),
              ),
            )
            : SizedBox(),
      ],
    );
  }
}

class SemicircleNumberWidget extends StatelessWidget {
  const SemicircleNumberWidget({super.key});

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
              '18',
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

class Doublewatchingwidget extends StatelessWidget {
  const Doublewatchingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,

            child: SemicircleNumberWidget(),
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

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final notchDepth = size.width * 0.08;

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(notchDepth, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
