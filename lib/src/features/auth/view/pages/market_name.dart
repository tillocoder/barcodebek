import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/services/auth/auth_login_services.dart';
import 'package:barcodbek/src/core/services/auth/authcread_services.dart';
import 'package:barcodbek/src/core/services/auth/otp_services.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_bottomnavigatorbar.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/data/entity/auth_register_model.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/auth/controller/register_controller.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/snakebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MarketName extends ConsumerWidget {
  const MarketName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    ref.watch(registerController);
    var con = ref.read(authConttroler);
    var regsterCtr = ref.read(registerController);
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
            controller: regsterCtr.marketName,
            hintText: Words.enter_market_name.tr(context),
          ),
          WGap.gap20,
          WTextFild(
            controller: regsterCtr.stir,
            hintText: Words.stir.tr(context),
          ),
          Gap(MediaQuery.of(context).size.height * 0.06),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
            child: WElevatedButton(
              text: Words.next.tr(context),
              onPressed: () async {

                AuthRegisterModel model = AuthRegisterModel(
                  phoneNumber: regsterCtr.phoneNumber.text,
                  password: regsterCtr.password.text,
                  type: con.egalik == false ? 'Director' : 'Vendor',
                  market: regsterCtr.marketName.text,
                  stir: regsterCtr.stir.text,
                  firstName: regsterCtr.name.text,
                );

                AuthLoginModel authModel = AuthLoginModel(
                  phoneNumber: regsterCtr.phoneNumber.text,
                  password: regsterCtr.password.text,
                );
                debugPrint('MODEL : ${model.toString()}');

                if (regsterCtr.stir.text.isNotEmpty &&
                    regsterCtr.marketName.text.isNotEmpty) {
                  await AuthCreateServices.POST(model, context);
                  await OTPServices.POST({
                    "phone_number": regsterCtr.phoneNumber.text,
                    "code": con.egalik == false ? '1111' : '2222'
                  }, context);
                  await AuthLoginServices.getToken(authModel);
                  await AuthLoginServices.getData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WBottomNav(),
                    ),
                  );
                } else {
                  snakebar(context, "Bunday market mavjud emas");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
