import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  AppImages._();

  /// profile
  static final List<Widget> profileImages = [
    SvgPicture.asset('assets/icons/home/activ_profile.svg'),
    Image.asset('assets/icons/profile/sotuvchi.png'),
    Image.asset('assets/icons/profile/setting.png'),
    Image.asset('assets/icons/profile/statistic.png'),
    Image.asset('assets/icons/profile/terms.png'),
    Image.asset('assets/icons/profile/logout.png'),
  ];

  /// bo'lim
  static final sell = Image.asset(
    'assets/icons/bolimlar/sell.png',
    width: 76,
    height: 76,
  );
  static final count = Image.asset(
    'assets/icons/bolimlar/count.png',
    width: 76,
    height: 76,
  );
  static final debtors = Image.asset(
    'assets/icons/bolimlar/debtors.png',
    width: 76,
    height: 76,
  );
  static final lending = Image.asset(
    'assets/icons/bolimlar/lending.png',
    width: 76,
    height: 76,
  );
  static final bsearch = Image.asset(
    'assets/icons/bolimlar/bsearch.png',
    width: 76,
    height: 76,
  );

  // buttomnavigatorbar
  static final home = Image.asset(
    "assets/images/bottomnavigatorber/home.png",
    width: 32,
    height: 32,
  );
  static final activhome = Image.asset(
    "assets/images/bottomnavigatorber/activhome.png",
    width: 32,
    height: 32,
  );

  static final menuimages = Image.asset(
    "assets/images/bottomnavigatorber/catalog.png",
    width: 32,
    height: 32,
  );
  static final activmenu = Image.asset(
    "assets/images/bottomnavigatorber/activmenu.png",
    width: 32,
    height: 32,
  );

  static final price = Image.asset(
    "assets/images/bottomnavigatorber/activepraqis.png",
    width: 32,
    height: 32,
  );
  static final activeprice = Image.asset(
    "assets/images/bottomnavigatorber/activprece.png",
    width: 32,
    height: 32,
  );

  static final person = Image.asset(
    "assets/images/bottomnavigatorber/pesron.png",
    width: 32,
    height: 32,
  );
  static final activeperson = Image.asset(
    "assets/images/bottomnavigatorber/activeperson.png",
    width: 32,
    height: 32,
  );
}
