import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_bottomnavigatorbar.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MarketName extends StatelessWidget {
  const MarketName({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Gap(MediaQuery.of(context).size.height * 0.16),
          Text(
            "Market Nomi",
            style: AppTextStyle.textStyle7,
          ),
          Gap(MediaQuery.of(context).size.height * 0.1),
          const WTextFild(
            hintText: "Marketingiz nomini to’g’ri kiriting !",
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
                    builder: (context) => const WBottomNav(),
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
