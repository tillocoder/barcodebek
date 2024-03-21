import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/config/setting/locale_controller.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/features/profile/view/pages/setting/controller/setting_controller.dart';
import 'package:barcodbek/src/features/profile/view/pages/setting/view/widgets/w_language_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingController);
    return Scaffold(
      backgroundColor: AppColorss.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              WBeacButton(
                isChec: true,
                title: Words.settings.tr(context),
              ),
              WGap.gap20,
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColorss.c_FFFFFF,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      WText(
                        Words.change_language.tr(context),
                        style: AppTextStyle.textStyle2,
                      ),
                      WGap.gap20,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WLanguageButton(
                            iconFlag: AppIcons.uz,
                            language: 'Uzb',
                            color: prefs.getString('lang') == 'uz'
                                ? AppColorss.c_D6BEFF
                                : null,
                            onPressed: () {
                              localController.changLanguages(Language.uz);
                            },
                          ),
                          WGap.gap15,
                          WLanguageButton(
                            iconFlag: AppIcons.ru,
                            language: 'Rus',
                            color: prefs.getString('lang') == 'ru'
                                ? AppColorss.c_D6BEFF
                                : null,
                            onPressed: () {
                              localController.changLanguages(Language.ru);
                            },
                          ),
                          WGap.gap15,
                          WLanguageButton(
                            iconFlag: AppIcons.en,
                            language: 'En',
                            color: prefs.getString('lang') == 'en'
                                ? AppColorss.c_D6BEFF
                                : null,
                            onPressed: () {
                              localController.changLanguages(Language.en);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              WGap.gap20,
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColorss.c_FFFFFF,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: WText(
                      Words.change_PIN_code.tr(context),
                      style: AppTextStyle.textStyle5,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColorss.c_9745FF,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
