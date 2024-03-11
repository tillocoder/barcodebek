import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_padding.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/future/onbording/view/pages/onbording_pages.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnbordingPages()),
          (route) => false);
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
          WGap(
            gap: 20.w,
          ),
          WPadding(
            padding: REdgeInsets.all(10),
            child: Center(
              child: Image.asset("assets/images/splash_onbording/splash.png"),
            ),
          ),
          WPadding(
            padding: REdgeInsets.symmetric(vertical: 30),
            child: Text("KESKAL", style: AppTextStyle.textStyle1),
          ),
        ],
      ),
    );
  }
}
