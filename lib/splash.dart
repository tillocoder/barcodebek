import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/future/onbording/view/pages/onbording_pages.dart';
import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 10,
          ),
          Center(
            child: Image.asset("assets/images/img.png"),
          ),
          const Spacer(
            flex: 7,
          ),
          Text("KESKAL", style: AppTextStyle.textStyle1),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
