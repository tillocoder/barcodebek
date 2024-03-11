import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionButton extends StatelessWidget {
  final String buttonText;
  final Color? backgroundColor;
  final Color? color;
  final Function()? onPressed;

  const PositionButton({
    super.key,
    required this.buttonText,
    this.backgroundColor,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(126.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
