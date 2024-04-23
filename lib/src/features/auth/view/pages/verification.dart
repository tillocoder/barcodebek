import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/services/auth/auth_login_services.dart';
import 'package:barcodbek/src/core/services/auth/otp_services.dart';
import 'package:barcodbek/src/core/services/vendor_active/vendor_servaces.dart';
import 'package:barcodbek/src/core/widgets/w_bottomnavigatorbar.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/data/entity/user_venndor_madel.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/auth/controller/register_controller.dart';
import 'package:barcodbek/src/features/auth/view/pages/confirmation.dart';
import 'package:barcodbek/src/features/auth/view/widgets/w_verification.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class VerificationPages extends ConsumerWidget {
  const VerificationPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
    // var con = ref.read(authConttroler);
    var regsterCtr = ref.read(registerController);
    return CustomScaffold(
      child: Column(
        children: [
          Wotp(
            controller: regsterCtr.otpController,
            otpText: Words.verification.tr(context),
            otpsubText: Words.verification_text.tr(context),
          ),
          Gap(MediaQuery.of(context).size.height * 0.06),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
            child: WElevatedButton(
              text: Words.next.tr(context),
              onPressed: () async {
                  phoneNumber:
                      '$raqam${regsterCtr.phoneNumber.text.split(' ').join()}',
                  password: regsterCtr.password.text,
                );
                debugPrint(authModel.toString());
                await OTPServices.POST({
                  "phone_number":
                      "$raqam${regsterCtr.phoneNumber.text.split(' ').join()}",
                  "code": regsterCtr.otpController.text
                }, context);
                debugPrint(authModel.toString());
                UserVendorModel vendorMadel = UserVendorModel(
                    phoneNumber:
                        "$raqam${regsterCtr.phoneNumber.text.split(' ').join()}",
                    confirm: true);
                await VendorServices.POST(
                    "$raqam${regsterCtr.phoneNumber.text.split(' ').join()}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Confirmation(),
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
