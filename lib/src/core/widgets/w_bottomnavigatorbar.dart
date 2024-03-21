import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/app_images.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:barcodbek/src/features/prices/view/pages/prices.dart';
import 'package:barcodbek/src/features/profile/view/pages/prifile_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/sections_pages.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell.dart';
import 'package:flutter/material.dart';

class WBottomNav extends StatefulWidget {
  const WBottomNav({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WBottomNavState createState() => _WBottomNavState();
}

class _WBottomNavState extends State<WBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    SectionsPages(),
    TovarQoshish(),
    PricesPages(),
    ProfilePage(),
  ];

  void _onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.home,
            label: '',
            activeIcon: AppIcons.activhome,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.menu,
            label: '',
            activeIcon: AppIcons.activmenu,
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 24,
              backgroundColor: AppColorss.c_8F00FF,
              child: AppIcons.scan,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppImages.price,
            activeIcon: AppImages.activeprice,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppImages.person,
            activeIcon: AppImages.activeperson,
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTab,
      ),
    );
  }
}
