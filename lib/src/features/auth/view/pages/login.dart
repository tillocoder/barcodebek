import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_padding.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/view/widgets/skib_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: WPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const WGap(
              gap: 10,
            ),
            Column(
              children: [
                WText("Assalomualaykum", style: AppTextStyle.textStyle2),
                const WGap(gap: 10),
                WText("Hisobga Kirish", style: AppTextStyle.textStyle5),
              ],
            ),
            Column(
              children: [
                WTextFild(
                  hintText: "+998 XX XXX XXXX",
                  iconPath: AppIcons.phone,
                  isSvg: true,
                ),
                const WGap(
                  gap: 20,
                ),
                WTextFild(
                  hintText: "Password",
                  iconPath: AppIcons.lock,
                  isSvg: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: WText(
                        "parolni tiklash?",
                        style: AppTextStyle.textStyle6,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const WGap(
                  gap: 20,
                ),
              ],
            ),
            SkipButton(
              text: 'Kirish',
              isText: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
            CupertinoButton(child: WText(
                "Ro’yhatdan O’tish",
                style: AppTextStyle.textStyle6,
              ),onPressed:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistorPages(),
                  ),
                );
              },)
          ],
        ),
      ),
    );
  }
}
