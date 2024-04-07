import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/auth/view/pages/login.dart';
import 'package:barcodbek/src/features/auth/view/pages/register_page.dart';
import 'package:flutter/material.dart';

class OnbordingPages extends StatelessWidget {
  const OnbordingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WText("KESKAL", style: AppTextStyle.textStyle1_),
              const Image(
                image:
                    AssetImage("assets/images/splash_onbording/onboarding.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WText(Words.assistant.tr(context),
                      style: AppTextStyle.textStyle2),
                  Text(
                    Words.onboarding_text.tr(context),
                    style: AppTextStyle.textStyle3,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              WElevatedButton(
                text: Words.getStarted.tr(context),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
