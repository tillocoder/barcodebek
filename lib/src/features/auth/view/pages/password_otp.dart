import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/auth/view/pages/create_a_new_password.dart';
import 'package:barcodbek/src/features/auth/view/widgets/w_verification.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PassworldOTP extends StatelessWidget {
  const PassworldOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Wotp(
            otpsubText: Words.sms_code.tr(context),
          ),
          Gap(MediaQuery.of(context).size.height * 0.06),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
            child: WElevatedButton(
              text: Words.next.tr(context),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateanewPassword(),
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
