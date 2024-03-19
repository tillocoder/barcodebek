import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static final lock = SvgPicture.asset('assets/icons/auth/lock.svg');
  static final person = SvgPicture.asset('assets/icons/auth/person.svg');
  static final phone = SvgPicture.asset('assets/icons/auth/phone.svg');
  static final notification = SvgPicture.asset('assets/icons/auth/phone.svg');
  static final search = SvgPicture.asset('assets/icons/home/search.svg');
  static final activsearch =
      SvgPicture.asset('assets/icons/home/activ_search.svg');
  static final delete = SvgPicture.asset('assets/icons/home/delete.svg');
  static final home = SvgPicture.asset('assets/icons/home/home.svg');
  static final activhome = SvgPicture.asset('assets/icons/home/activ_home.svg');
  static final menu = SvgPicture.asset('assets/icons/home/menu.svg');
  static final activmenu = SvgPicture.asset('assets/icons/home/activmenu.svg');
  static final scan = SvgPicture.asset('assets/icons/home/scan.svg');
  static final profile = SvgPicture.asset('assets/icons/home/profile.svg');
  static final activprofile =
      SvgPicture.asset('assets/icons/home/activ_profile.svg');
  static final historydate =
      SvgPicture.asset('assets/icons/home/history_date.svg');
  static final flash = SvgPicture.asset('assets/icons/home/flash.svg');
  static final check = SvgPicture.asset('assets/icons/home/check.svg');
  static final price = SvgPicture.asset('assets/icons/home/price.svg');
  static const arrow_left = Center(
    child: Icon(
      Icons.arrow_back_ios,
      color: AppColorss.c_9745FF,
    ),
  );

  /// profile
  static final List<Widget> profileIcons = [
    SvgPicture.asset('assets/icons/home/activ_profile.svg'),
    Image.asset('assets/icons/profile/setting.png'),
    Image.asset('assets/icons/profile/statistic.png'),
    Image.asset('assets/icons/profile/terms.png'),
    Image.asset('assets/icons/profile/logout.png'),
  ];
  static final sotuvchi = Image.asset('assets/icons/profile/sotuvchi.png');

  /// bo'lim
  static final sell =
      Image.asset('assets/icons/bolimlar/sell.png', width: 76, height: 76);
  static final count =
      Image.asset('assets/icons/bolimlar/count.png', width: 76, height: 76);
  static final debtors =
      Image.asset('assets/icons/bolimlar/debtors.png', width: 76, height: 76);
  static final lending =
      Image.asset('assets/icons/bolimlar/lending.png', width: 76, height: 76);
  static final bsearch =
      Image.asset('assets/icons/bolimlar/bsearch.png', width: 76, height: 76);

  /// setting
  static final uz = Image.asset(
    'assets/icons/flag/uz.png',
    width: 60,
    height: 60,
  );
  static final ru = Image.asset(
    'assets/icons/flag/ru.png',
    width: 60,
    height: 60,
  );
  static final en = Image.asset(
    'assets/icons/flag/en.png',
    width: 60,
    height: 60,
  );
}
