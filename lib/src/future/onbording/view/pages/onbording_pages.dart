import 'package:barcodbek/src/future/auth/view/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbordingPages extends StatelessWidget {
  const OnbordingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "KESKAL",
                style: TextStyle(
                  fontSize: 22.sp,
                  color: const Color.fromRGBO(151, 69, 255, 1),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Image(
                image: AssetImage("assets/images/img_1.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Yordamchi",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: const Color.fromRGBO(0, 0, 0, 0.85),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Mengga mahsulotlar narxini jonating va men uni saqlab olaman",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(154, 154, 154, 0.45),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(151, 69, 255, 1),
                    fixedSize: Size(double.maxFinite, 70.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(24.r))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
