import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/features/auth/view/pages/login.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:barcodbek/src/features/profile/view/pages/prifile_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/sections_pages.dart';
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
    LoginPage(),
    LoginPage(),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
            activeIcon: Icon(
              Icons.home_filled,
              color: AppColorss.c_8F00FF,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
            activeIcon: Icon(
              Icons.search,
              color: AppColorss.c_8F00FF,
            ),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: AppColorss.c_8F00FF,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones_rounded),
            activeIcon: Icon(
              Icons.headphones_rounded,
              color: AppColorss.c_8F00FF,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(
              Icons.person,
              color: AppColorss.c_8F00FF,
            ),
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTab,
      ),
    );
  }
}
