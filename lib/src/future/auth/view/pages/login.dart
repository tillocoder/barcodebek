import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_padding.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/future/auth/view/pages/register_page.dart';
import 'package:barcodbek/src/future/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/future/home/view/pages/home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/skib_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: WPadding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WGap(
                  gap: 10.w,
                ),
                Column(
                  children: [
                    WText("Assalomualaykum", style: AppTextStyle.textStyle2),
                    Gap(10.w),
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
                    WGap(
                      gap: 20.w,
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
                    WGap(
                      gap: 20.w,
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistorPages(),
                      ),
                    );
                  },
                  child: WText(
                    "Ro’yhatdan O’tish",
                    style: AppTextStyle.textStyle6,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
