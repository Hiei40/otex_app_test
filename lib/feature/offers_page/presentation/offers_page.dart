import 'package:flutter/material.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/all_categories.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/all_offers.dart';
import 'package:otex_app_test/feature/offers_page/presentation/widget/product_grid_page.dart';


class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AllOffers(selectedIndex: selectedIndex,),
            AllCategories(),
            SizedBox(height: 20),
            ProductGridPage(),
          ],
        ),
      ),
    );
  }
}


