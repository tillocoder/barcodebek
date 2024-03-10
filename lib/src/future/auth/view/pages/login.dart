import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gap(10.w),
                Column(
                  children: [
                    Text("Assalomualaykum", style: AppTextStyle.textStyle2),
                    Gap(10.w),
                    Text("Hisobga Kirish", style: AppTextStyle.textStyle5),
                  ],
                ),
                Column(
                  children: [
                    const WTextFild(
                        hintText: "+998 XX XXX XXXX",
                        iconPath: "assets/icons/auth/phone.svg"),
                    Gap(20.w),
                    const WTextFild(
                      hintText: "Password",
                      iconPath: "assets/icons/auth/lock.svg",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          child: Text(
                            "parolni tiklash?",
                            style: AppTextStyle.textStyle6,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Gap(20.w)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Kirish",
                      style: AppTextStyle.textStyle2,
                    ),
                    Gap(20.sp),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 72.w,
                        height: 42.h,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            gradient: LinearGradient(
                              transform: GradientRotation(0.8.sp),
                              colors: const [
                                Color(0xFFC3E6FF),
                                Color(0xFF9745FF),
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            color: AppColorss.c_FFFFFF,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Ro’yhatdan O’tish",
                    style: AppTextStyle.textStyle6,
                  ),
                )
              ],
            ),
          child: Column(
            children: [
              Text("Assalomualaykum", style: AppTextStyle.textStyle2),
              Text("Hisobga Kirish", style: AppTextStyle.textStyle5),
              const WTextFild(
                  hintText: "+998 XX XXX XXXX",
                  iconPath: "assets/icons/auth/phone.svg"),
              Gap(25.w),
              WTextFild(
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
