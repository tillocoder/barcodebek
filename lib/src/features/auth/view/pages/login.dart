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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'register_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authConttroler);
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
                startNumber: raqam,
                formatter: [
                  MaskedTextInputFormatter(
                    mask: '## ### ## ##',
                    separator: ' ',
                    filter: RegExp('[0-9]'),
                  ),
                ],
                controller: regsterCtr.loginNumber,
                hintText: " XX XXX XXXX",
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
                phoneNumber:
                    '$raqam${regsterCtr.loginNumber.text.split(' ').join('')}',
                password: regsterCtr.logenPasword.text,
              );
              await boxToken.put('number',
                  '$raqam${regsterCtr.loginNumber.text.split(' ').join('')}');
              await AuthLoginServices.getToken(authModel);

              boxToken.get('tokenn') != null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WBottomNav(),
                      ),
                    )
                  : const LoginPage();
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

class MaskedTextInputFormatter extends TextInputFormatter {
  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
    required this.filter,
  });

  final String mask;
  final String separator;
  final RegExp filter;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = newValue.text;
    final String separatorWithText = text.replaceAll(separator, '');
    final Iterable<Match> matches = filter.allMatches(separatorWithText);

    if (matches.length != separatorWithText.length) return oldValue;

    String formattedText = "$text";
    formattedText.startsWith('+');

    debugPrint("ALpomish Slaom $formattedText");

    // Apply the mask and separators
    final StringBuffer bufferText = StringBuffer();
    int maskIndex = 0;

    for (int i = 0; i < formattedText.length; i++) {
      if (maskIndex >= mask.length) break;

      if (mask[maskIndex] == separator) {
        bufferText.write(separator);
        maskIndex++;
      }

      if (filter.hasMatch(formattedText[i])) {
        bufferText.write(formattedText[i]);
        maskIndex++;
      }
    }

    return TextEditingValue(
      text: bufferText.toString(),
      selection: TextSelection.collapsed(offset: bufferText.length),
    );
  }
}
