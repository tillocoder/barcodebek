import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/view/widgets/skib_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CreateanewPassword extends StatelessWidget {
  const CreateanewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Yangi Parol Yaratish",
            style: AppTextStyle.textStyle7,
          ),
          Column(
            children: [
              const WTextFild(
                hintText: "Yanggi parol",
                iconPath: Icon(CupertinoIcons.eye_slash),
              ),
              Gap(
                MediaQuery.of(context).size.height * 0.02,
              ),
              WTextFild(
                hintText: "Yanggi parol",
                iconPath: const Icon(CupertinoIcons.eye_slash),
                suffixIcon: SvgPicture.asset("assets/icons/auth/lock.svg"),
              ),
            ],
          ),
          SkipButton(
            text: 'Yuborish',
            onTap: () {},
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: AppColorss.c_FFFFFF,
            ),
          )
        ],
      ),
    );
  }
}
