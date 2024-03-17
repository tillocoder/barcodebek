import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';

class WShowElvationButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const WShowElvationButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 46,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColorss.c_FFFFFF,
              border: Border.all(width: 1, color: AppColorss.c_00007),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              text,
              style: AppTextStyle.textStyle1_,
            ),
          ),
        ),
      ),
    );
  }
}
