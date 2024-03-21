import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
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
          WText(
            Words.market_name.tr(context),
            style: AppTextStyle.textStyle7,
          ),
          Gap(MediaQuery.of(context).size.height * 0.1),
          WTextFild(
            hintText: Words.enter_market_name.tr(context),
          ),
          WGap.gap20,
          WTextFild(
            hintText: Words.stir.tr(context),
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
