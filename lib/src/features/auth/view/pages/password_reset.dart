import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgers/w_elvated_button.dart';
import 'package:barcodbek/src/features/auth/view/pages/password_otp.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PasswordresetPages extends StatelessWidget {
  const PasswordresetPages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Gap(MediaQuery.of(context).size.height * 0.16),
          Text(
            "Parolni Tiklash",
            style: AppTextStyle.textStyle7,
          ),
          Gap(MediaQuery.of(context).size.height * 0.1),
          WTextFild(
            hintText: "+998 XX XXX XXXX",
            iconPath: SvgPicture.asset("assets/icons/auth/phone.svg"),
          ),
          Gap(MediaQuery.of(context).size.height * 0.06),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
            child: WElevatedButton(
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PassworldOTP(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
