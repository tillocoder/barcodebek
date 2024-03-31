import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';

class WElevatedButton1 extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;

  const WElevatedButton1({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size(double.maxFinite, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(14),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.textStyle1,
      ),
    );
  }
}
