import 'package:flutter/material.dart';
import 'package:otex_app_test/utils/fonts/fonts.dart';
import 'feature/Bottom_nav_bar/presentaion/bottom_nav_bar.dart';
import 'feature/offers_page/presentation/offers_page.dart';



void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
            fontFamily: Font.tajwal
        ),
        home: Directionality(textDirection: TextDirection.rtl,
        child: const BottomNavBar()),
      ),
    );
  }
}

