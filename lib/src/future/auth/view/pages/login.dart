import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/future/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/future/home/view/pages/home_Page.dart';
import 'package:flutter/cupertino.dart';
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
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
                SkipButton(
                  text: 'Kirish',
                  isText: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistorPages(),
                      ),
                    );
                  },
                  child: Text(
                    "Ro’yhatdan O’tish",
                    style: AppTextStyle.textStyle6,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final String text;
  final bool isText;
  final Function()? onTap;
  final Widget child;

  const SkipButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isText,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          isText == true ? text : '',
          style: AppTextStyle.textStyle2,
        ),
        Gap(20.sp),
        GestureDetector(
          onTap: onTap,
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
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
