import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/config/setting/locale_controller.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/profile/view/pages/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingController);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 54,
        centerTitle: true,
        title: Text(
          Words.setting.tr(context),
          style: AppTextStyle.textStyle2,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Card(
            color: AppColorss.c_F8F8FB,
            elevation: 3,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: AppColorss.c_F8F8FB, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Tilni O’zgartirish',
                      style: AppTextStyle.textStyle2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WLanguageButton(
                          iconFlag: AppIcons.uz,
                          language: 'Uzb',
                          color: prefs.getString('lang')== 'uz'  ? AppColorss.c_D6BEFF : null,
                          onPressed: () {
                            localController.changLanguages(Language.uz);
                          },
                        ),
                        WLanguageButton(
                          iconFlag: AppIcons.ru,
                          language: 'Rus',
                          color: prefs.getString('lang')== 'ru' ? AppColorss.c_D6BEFF : null,
                          onPressed: () {
                            localController.changLanguages(Language.ru);
                          },
                        ),
                        WLanguageButton(
                          iconFlag: AppIcons.en,
                          language: 'En',
                          color: prefs.getString('lang')== 'en' ? AppColorss.c_D6BEFF : null,
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
          ),
          ListTile(
            title: Text(
              'PIN-kodni o’zgartirish',
              style: AppTextStyle.textStyle5,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}

class WLanguageButton extends StatelessWidget {
  final String language;
  final Widget? iconFlag;
  final void Function()? onPressed;
  final Color? color;
  const WLanguageButton({
    super.key,
    required this.language,
    this.onPressed,
    this.color,
    this.iconFlag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColorss.c_9745FF, width: 2),
            borderRadius: BorderRadius.circular(14),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: iconFlag,
                ),
                Text(
                  language,
                  style: AppTextStyle.textStyle10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
