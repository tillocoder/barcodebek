import 'package:barcodbek/src/future/auth/view/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/widgets/custom_scaffold.dart';
import '../widgets/wtext_fild.dart';

class RegistorPages extends StatelessWidget {
  const RegistorPages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Akkount Yaratish",
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WTextFild(
                      hintText: "Ismingiz",
                      iconPath: "assets/icons/auth/person.svg"),
                  Gap(10.w),
                  const WTextFild(
                      hintText: "+998 XX XXX XXXX",
                      iconPath: "assets/icons/auth/phone.svg"),
                  Gap(10.w),
                  const WTextFild(
                    hintText: "Parol",
                    iconPath: "assets/icons/auth/lock.svg",
                  ),
                  Gap(20.w),
                  const WTextFild(
                    hintText: "Parolingizni qayta kiriting",
                    iconPath: "assets/icons/auth/lock.svg",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Sotuvchi"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Direktor"),
                  ),
                ],
              ),
              SkipButton(
                text: "Yaratish",
                onTap: () {},
                isText: true,
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
