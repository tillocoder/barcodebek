import 'dart:async';

import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/constants/widgets/custom_scaffold.dart';
import 'package:barcodbek/src/core/database/app_password.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_bottomnavigatorbar.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

String pwrd = '';
bool isB = true;
StreamController<ErrorAnimationType>? errorController;

class AppPasswordPages extends StatefulWidget {
  const AppPasswordPages({Key? key}) : super(key: key);

  @override
  State<AppPasswordPages> createState() => _AppPasswordPagesState();
}

class _AppPasswordPagesState extends State<AppPasswordPages> {
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            WText(
              "Ilova Qulfi",
              style: AppTextStyle.textStyle2,
            ),
            WText(
              "Ilovaga parol O’rnating",
              style: AppTextStyle.textStyle3,
            ),
            const Spacer(),
            Column(
              children: [
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: true,
                  obscuringWidget: const Text("*"),
                  blinkWhenObscuring: true,
                  errorAnimationController: errorController,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedColor: Colors.purple,
                    activeColor: Colors.green,
                    borderWidth: 1,
                    fieldWidth: 60,
                    fieldHeight: 90,
                    inactiveColor: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  cursorColor: Colors.black,
                  controller: AppPassword.textPin,
                  keyboardType: TextInputType.number,
                  onChanged: (value) async {
                    pinCode(context);
                  },
                ),
              ],
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}

void pinCode(BuildContext context) async {
  if (AppPassword.textPin.text.length == 4 && AppPassword.pin == null) {
    debugPrint("salom");
    if (isB) {
      debugPrint("alik");
      pwrd = AppPassword.textPin.text;
      AppPassword.textPin.clear();
      isB = false;
    } else {
      await AppPassword.save(AppPassword.textPin.text);
      if (AppPassword.textPin.text == pwrd) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WBottomNav(),
          ),
        );
      } else {
        if (AppPassword.textPin.text.length == 4) {
          errorController!.add(ErrorAnimationType.shake);
        }
      }
    }
  }
  if (AppPassword.pin == AppPassword.textPin.text) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WBottomNav(),
      ),
    );
  } else {
    if (AppPassword.textPin.text.length == 4) {
      errorController!.add(ErrorAnimationType.shake);
    }
  }
}
