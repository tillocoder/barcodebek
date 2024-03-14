import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/view/pages/password_reset.dart';
import 'package:barcodbek/src/features/auth/view/pages/verification.dart';
import 'package:barcodbek/src/features/auth/view/widgets/skib_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WGap.gap10,
          Column(
            children: [
              WText("Assalomualaykum", style: AppTextStyle.textStyle2),
              WGap.gap10,
              WText("Hisobga Kirish", style: AppTextStyle.textStyle5),
            ],
          ),
          Column(
            children: [
              WTextFild(
                hintText: "+998 XX XXX XXXX",
                iconPath: AppIcons.phone,
              ),
              Gap(
                MediaQuery.of(context).size.height * 0.02,
              ),
              WTextFild(
                hintText: "Password",
                iconPath: AppIcons.lock,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: WText(
                      "parolni tiklash?",
                      style: AppTextStyle.textStyle6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordresetPages(),
                        ),
                      );
                    },
                  )
                ],
              ),
              WGap.gap20
            ],
          ),
          SkipButton(
            text: 'Kirish',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerificationPages(),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
          CupertinoButton(
            child: Text(
              "Ro’yhatdan O’tish",
              style: AppTextStyle.textStyle6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistorPages(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
