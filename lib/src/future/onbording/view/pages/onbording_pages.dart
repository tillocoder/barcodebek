import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/future/auth/view/pages/login.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgers/w_elvated_button.dart';

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
              Text("KESKAL", style: AppTextStyle.textStyle1_),
              const Image(
                image: AssetImage("assets/images/img_1.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Yordamchi", style: AppTextStyle.textStyle2),
                  Text(
                    "Mengga mahsulotlar narxini jonating va men uni saqlab olaman",
                    style: AppTextStyle.textStyle3,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              WElevatedButton(
                text: "Get Started",
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