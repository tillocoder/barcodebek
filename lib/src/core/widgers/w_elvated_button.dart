import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        fixedSize: Size(double.maxFinite, 70.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(24.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyle.textStyle1),
    );
  }
}
