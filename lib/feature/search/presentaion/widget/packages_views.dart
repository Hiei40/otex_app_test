import 'package:flutter/material.dart';
import 'package:otex_app_test/feature/search/presentaion/widget/package_widget.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/photos/photos.dart';
import 'banner_clipper.dart';
import 'double_watching_widget.dart';
import 'list_tile_custom_package.dart';

class PackagesViews extends StatefulWidget {
  final bool ischeck;
  final String name;
  final String? offer;
  final int? x;
  const PackagesViews({
    super.key,
    required this.ischeck,
    required this.name,
    this.offer,
    required this.x,
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
            SizedBox(height: 17),
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
              constraints: const BoxConstraints(minHeight: 85),
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
                                width: .50 * MediaQuery.of(context).size.width,
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
                                  : Doublewatchingwidget(x: widget.x ?? 0),
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




