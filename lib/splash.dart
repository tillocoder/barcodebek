import 'package:barcodbek/src/future/onbording/view/pages/onbording_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnbordingPages()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(151, 69, 255, 1),
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
          Text(
            "KESKAL",
            style: TextStyle(
              fontSize: 22.sp,
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
