import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Wotp extends StatelessWidget {
  final String? otpText;
  final String? otpsubText;

  const Wotp({
    super.key,
    this.otpText,
    this.otpsubText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          Gap(MediaQuery.of(context).size.height * 0.16),
          Text(
            otpText ?? '',
            style: AppTextStyle.textStyle7,
          ),
          const Gap(6),
          Text(
            otpsubText ?? "no argument",
            style: AppTextStyle.textStyle8,
            textAlign: TextAlign.center,
          ),
          Gap(MediaQuery.of(context).size.height * 0.030),
          PinCodeTextField(
            cursorColor: AppColorss.c_000000,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 4,
            cursorHeight: 36,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            pinTheme: PinTheme(
              selectedColor: AppColorss.c_8F00FF,
              activeColor: Colors.green,
              shape: PinCodeFieldShape.box,
              borderWidth: 1,
              fieldWidth: 54,
              fieldHeight: 68,
              inactiveColor: AppColorss.c_8F00FF,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
