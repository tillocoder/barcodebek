// ignore_for_file: empty_statements

import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/profile/view/pages/edit_profile/view/pages/edit_profile.dart';
import 'package:barcodbek/src/features/profile/view/pages/savdo_tarixi/view/pages/statistic_page.dart';
import 'package:barcodbek/src/features/profile/view/pages/seller/view/pages/seller_page.dart';
import 'package:barcodbek/src/features/profile/view/pages/setting/view/pages/setting_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/privacy_policy.dart/privacy_policy_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/sections_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    // var con = ref.read(authConttroler);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: WText(
          Words.profile.tr(context),
          style: AppTextStyle.textStyle2,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...List.generate(
            6,
            (index) => Padding(
              padding: const EdgeInsets.all(5),
              child: wSWButton(
                index: index,
                page: [
                  const EditeProfile(),
                  const SellerPage(),
                  const SettingPage(),
                  const SavdoTarixPage(),
                  const PrivacyPolicyPage(),
                  const EditeProfile(),
                ],
                context: context,
                child: ListTile(
                  leading: SizedBox(
                    height: 54,
                    width: 54,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColorss.c_D6BEFF,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppIcons.profileIcons[index],
                      ),
                    ),
                  ),
                  title: WText(
                    profileTexts[index].tr(context),
                    style: AppTextStyle.textStyle5,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Words> profileTexts = [
  Words.edit_profile,
  Words.seller,
  Words.settings,
  Words.trade_history,
  Words.terms_privacy_policy,
  Words.logout,
];
