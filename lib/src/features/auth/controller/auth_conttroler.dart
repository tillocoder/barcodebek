import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/features/profile/view/pages/prifile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authConttroler =
    ChangeNotifierProvider.autoDispose((ref) => AuthConttroler());

class AuthConttroler extends ChangeNotifier {
  bool? egalik;
  int length = 5;

  void onTap(bool value) {
    egalik = value;
    if (egalik == true) {
      length = 5;
    } else {
      length = 6;
    }
    notifyListeners();
  }

  void logintap(String type) {
    if (type == 'Vendor') {
      length = 5;
      profileTexts.remove('Sotuvchilarim');
      debugPrint(profileTexts.length.toString());
      debugPrint(AppIcons.profileIcons.length.toString());
      notifyListeners();
    } else if (type == 'Director') {
      length = 6;
      profileTexts.insert(1, Words.seller);

      notifyListeners();

      debugPrint(profileTexts.length.toString());
      debugPrint(AppIcons.profileIcons.length.toString());
    }
    notifyListeners();
  }
}
