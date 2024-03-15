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
}
