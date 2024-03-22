import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/app_images.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:barcodbek/src/features/prices/view/pages/prices_page.dart';
import 'package:barcodbek/src/features/profile/view/pages/prifile_page.dart';
import 'package:barcodbek/src/features/scanner/view/pages/scan_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/sections_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WBottomNav extends ConsumerWidget {
  const WBottomNav({Key? key}) : super(key: key);

  final List<Widget> pages = const [
    HomePage(),
    SectionsPages(),
    ScannPage(),
    PricesPages(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(bottomnavctr);
    var ctr= ref.read(bottomnavctr);
    return Scaffold(
      body: pages[ctr.currentIndex],
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
        currentIndex: ctr.currentIndex,
        onTap: ctr.onTab,
      ),
    );
  }
}

final bottomnavctr = ChangeNotifierProvider.autoDispose((ref) => BottomNavCtrl());

class BottomNavCtrl extends ChangeNotifier {
  int currentIndex = 0;

  void onTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
