import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/auth/view/pages/market_name.dart';
import 'package:barcodbek/src/features/auth/view/widgets/w_verification.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerificationPages extends StatelessWidget {
  const VerificationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      
      child: Column(
        children: [
          const Wotp(
            otpText: 'OTP',
            otpsubText:
                'Ushbu raqamga tasdiqlash kodini yubordik tekshiring va kiriting',
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
                    builder: (context) => const MarketName(),
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
