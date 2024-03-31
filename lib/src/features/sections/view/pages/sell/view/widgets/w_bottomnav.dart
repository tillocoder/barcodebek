import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:barcodbek/src/features/sections/view/widgets/weleavtedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WCustomBottomNav extends ConsumerWidget {
  WCustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    var authctr = ref.read(authConttroler);
    var sellctr = ref.read(sellController);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ToTol",
                style: AppTextStyle.textStyle4,
              ),
              Text(
                sellctr.umumisuma(),
                style: AppTextStyle.textStyle1_,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: WElevatedButton1(
                  backgroundColor:
                      (authctr.egalik != null && authctr.egalik == true)
                          ? AppColorss.c_8F00FF
                          : AppColorss.c_707070,
                  text: "Qarzga",
                  onPressed: () {
                    authctr.onTap(true);
                  },
                ),
              ),
              WGap.gap10,
              Expanded(
                child: WElevatedButton1(
                  backgroundColor:
                      (authctr.egalik != null && authctr.egalik == false)
                          ? AppColorss.c_8F00FF
                          : AppColorss.c_707070,
                  text: "Sotish",
                  onPressed: () {
                    authctr.onTap(false);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
