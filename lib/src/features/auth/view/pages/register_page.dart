import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/auth/view/pages/market_name.dart';
import 'package:barcodbek/src/features/auth/view/widgets/skib_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/w_position.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

bool direkter = true;

class RegistorPages extends ConsumerWidget {
  const RegistorPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    var con = ref.read(authConttroler);
    return CustomScaffold(
      child: Column(
        children: [
          const Spacer(
            flex: 5,
          ),
          Text(
            Words.create_an_account.tr(context),
            style: AppTextStyle.textStyle2,
          ),
          const Spacer(
            flex: 5,
          ),
          WTextFild(
            hintText: Words.your_name.tr(context),
            iconPath: AppIcons.person,
          ),
          Gap(
            MediaQuery.of(context).size.height * 0.02,
          ),
          WTextFild(
            hintText: "+998 XX XXX XXXX",
            iconPath: AppIcons.phone,
          ),
          Gap(
            MediaQuery.of(context).size.height * 0.02,
          ),
          WTextFild(
            hintText: Words.password.tr(context),
            iconPath: AppIcons.lock,
          ),
          Gap(
            MediaQuery.of(context).size.height * 0.02,
          ),
          WTextFild(
            hintText: Words.confirm_password.tr(context),
            iconPath: AppIcons.lock,
          ),
          const Spacer(
            flex: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PositionButton(
                buttonText: Words.vendor.tr(context),
                onPressed: () {
                  con.onTap(true);
                },
                color: (con.egalik == null)
                    ? AppColorss.c_000000
                    : con.egalik == true
                        ? AppColorss.c_FFFFFF
                        : AppColorss.c_000000,
                backgroundColor: (con.egalik != null && con.egalik == true)
                    ? AppColorss.c_8F00FF
                    : AppColorss.c_707070,
              ),
              const Gap(20),
              PositionButton(
                buttonText: Words.owner.tr(context),
                onPressed: () {
                  con.onTap(false);
                },
                backgroundColor: (con.egalik != null && con.egalik == false)
                    ? AppColorss.c_8F00FF
                    : AppColorss.c_707070,
                color: (con.egalik == null)
                    ? AppColorss.c_000000
                    : con.egalik == false
                        ? AppColorss.c_FFFFFF
                        : AppColorss.c_000000,
              ),
            ],
          ),
          const Spacer(
            flex: 4,
          ),
          SkipButton(
            text: Words.create.tr(context),
            onTap: () {
              if (con.egalik != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MarketName(),
                  ),
                );
              }
            },
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
