import 'package:barcodbek/src/core/componets/w_padding.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/auth/view/widgets/skib_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/w_position.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class RegistorPages extends ConsumerWidget {
  const RegistorPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    var con = ref.read(authConttroler);
    return CustomScaffold(
      child: WPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Spacer(
              flex: 5,
            ),
            Text(
              "Akkount Yaratish",
              style: AppTextStyle.textStyle2,
            ),
            const Spacer(
              flex: 5,
            ),
            WTextFild(
              hintText: "Ismingiz",
              iconPath: AppIcons.person,
              isSvg: true,
            ),
            const Gap(16),
            WTextFild(
              hintText: "+998 XX XXX XXXX",
              iconPath: AppIcons.phone,
              isSvg: true,
            ),
            const Gap(16),
            WTextFild(
              hintText: "Parol",
              iconPath: AppIcons.lock,
              isSvg: true,
            ),
            const Gap(16),
            WTextFild(
              hintText: "Parolingizni qayta kiriting",
              iconPath: AppIcons.lock,
              isSvg: true,
            ),
            const Spacer(
              flex: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PositionButton(
                  buttonText: 'Sotuvchi',
                  onPressed: () {
                    con.onTap(true);
                  },
                  color: (con.isChecked == null)
                      ? AppColorss.c_000000
                      : con.isChecked == true
                          ? AppColorss.c_FFFFFF
                          : AppColorss.c_000000,
                  backgroundColor:
                      (con.isChecked != null && con.isChecked == true)
                          ? AppColorss.c_8F00FF
                          : AppColorss.c_C8C8C8,
                ),
                const Gap(20),
                PositionButton(
                  buttonText: 'Direktor',
                  onPressed: () {
                    con.onTap(false);
                  },
                  backgroundColor:
                      (con.isChecked != null && con.isChecked == false)
                          ? AppColorss.c_8F00FF
                          : AppColorss.c_C8C8C8,
                  color: (con.isChecked == null)
                      ? AppColorss.c_000000
                      : con.isChecked == false
                          ? AppColorss.c_FFFFFF
                          : AppColorss.c_000000,
                ),
              ],
            ),
            const Spacer(
              flex: 4,
            ),
            SkipButton(
              text: "Yaratish",
              onTap: () {
                if (con.isChecked != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
              },
              isText: true,
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
