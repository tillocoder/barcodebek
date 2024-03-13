import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_padding.dart';
import 'package:barcodbek/src/core/config/router/name_routes.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(Routes.onboarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorss.c_9745FF,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WGap(
            gap: 20,
          ),
          WPadding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Image.asset("assets/images/splash_onbording/splash.png"),
            ),
          ),
          WPadding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text("KESKAL", style: AppTextStyle.textStyle1),
          ),
        ],
      ),
    );
  }
}
