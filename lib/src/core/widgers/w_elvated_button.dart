import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/text_style.dart';

class WElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const WElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorss.c_9745FF,
        fixedSize: const Size(double.maxFinite, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(24),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyle.textStyle1),
    );
  }
}
