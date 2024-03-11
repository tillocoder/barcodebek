import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/future/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text("Assalomualaykum", style: AppTextStyle.textStyle2),
              Text("Hisobga Kirish", style: AppTextStyle.textStyle5),
              const WTextFild(
                  hintText: "+998 XX XXX XXXX",
                  iconPath: "assets/icons/auth/phone.svg"),
              Gap(25.w),
              const WTextFild(
                hintText: "Password",
                iconPath: "assets/icons/auth/phone.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
