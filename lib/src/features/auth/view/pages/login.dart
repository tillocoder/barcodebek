import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/services/auth/auth_login_services.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_bottomnavigatorbar.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/auth/controller/register_controller.dart';
import 'package:barcodbek/src/features/auth/view/pages/password_reset.dart';
import 'package:barcodbek/src/features/auth/view/widgets/skib_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/home/view/pages/owner_home_page.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/snakebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'register_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    var con = ref.read(authConttroler);
    ref.watch(registerController);
    var regsterCtr = ref.read(registerController);
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WGap.gap10,
          Column(
            children: [
              WText(Words.greetings.tr(context),
                  style: AppTextStyle.textStyle2),
              WGap.gap10,
              WText(Words.login.tr(context), style: AppTextStyle.textStyle5),
            ],
          ),
          Column(
            children: [
              WTextFild(
                controller: regsterCtr.loginNumber,
                hintText: "+998 XX XXX XXXX",
                iconPath: AppIcons.phone,
              ),
              Gap(
                MediaQuery.of(context).size.height * 0.02,
              ),
              WTextFild(
                controller: regsterCtr.logenPasword,
                hintText: Words.password.tr(context),
                iconPath: AppIcons.lock,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: WText(
                      Words.forgetPassword.tr(context),
                      style: AppTextStyle.textStyle6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordresetPages(),
                        ),
                      );
                    },
                  )
                ],
              ),
              WGap.gap20
            ],
          ),
          SkipButton(
            text: Words.next.tr(context),
            onTap: () async {
              await boxToken.clear();
              await boxUser.clear();
              AuthLoginModel authModel = AuthLoginModel(
                phoneNumber: regsterCtr.loginNumber.text,
                password: regsterCtr.logenPasword.text,
              );
              debugPrint(authModel.phoneNumber);
              debugPrint(authModel.password);
              await boxToken.put('number', regsterCtr.loginNumber.text);
              await AuthLoginServices.getToken(authModel);
              await AuthLoginServices.getData();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WBottomNav(),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
          CupertinoButton(
            child: WText(
              Words.registration.tr(context),
              style: AppTextStyle.textStyle6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistorPages(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
