import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/services/auth/auth_login_services.dart';
import 'package:barcodbek/src/core/services/auth/authcread_services.dart';
import 'package:barcodbek/src/data/entity/user_get_model.dart';
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
      profileTexts.remove('Sotuvchilarim');
      AppIcons.profileIcons.remove(AppIcons.sotuvchi);
    } else {
      length = 6;
      profileTexts.insert(1, Words.seller);
      AppIcons.profileIcons.insert(
        1,
        AppIcons.sotuvchi,
      );
    }
    notifyListeners();
  }
}
