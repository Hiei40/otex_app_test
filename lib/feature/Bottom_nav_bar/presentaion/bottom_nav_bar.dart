import 'package:flutter/material.dart';
import 'package:otex_app_test/feature/Bottom_nav_bar/presentaion/widget/container_icon_active.dart';
import 'package:otex_app_test/feature/Bottom_nav_bar/presentaion/widget/container_icon_add.dart';
import 'package:otex_app_test/feature/Bottom_nav_bar/presentaion/widget/container_icon_unactive.dart';
import 'package:otex_app_test/utils/colors/colors.dart';
import '../../offers_page/presentation/offers_page.dart';
import '../../search/presentaion/filtering.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = const [
    OffersPage(),
    Center(child: Text("محادثة")),
    Center(child: Text("أضف اعلان")),
    Center(child: Text("إعلاناتي")),
    Center(child: Text("حسابي")),
  ];

  final List<String> _icons = [
    "assets/bottomnavbar/bungalow.png",
    "assets/bottomnavbar/chat.png",
    "assets/bottomnavbar/add_box.png",
    "assets/bottomnavbar/dataset.png",
    "assets/bottomnavbar/account_circle.png",
  ];

  final List<String> _labels = [
    "الرئيسية",
    "محادثة",
    "أضف إعلان",
    "إعلاناتي",
    "حسابي",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          color: AppColors.white,
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Filtering()),
                    );
                  } else {
                    _onItemTapped(index);
                  }
                },
                child: index == 2
                    ? Containericonadd(
                  iconPath: _icons[index],
                  label: _labels[index],
                )
                    : _selectedIndex == index
                    ? Containericon(
                  iconPath: _icons[index],
                  label: _labels[index],
                )
                    : Containericonunactive(
                  iconPath: _icons[index],
                  label: _labels[index],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
