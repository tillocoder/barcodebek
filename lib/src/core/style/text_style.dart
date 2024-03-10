import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final textStyle1 = GoogleFonts.signika(
      textStyle: TextStyle(
          color: AppColorss.c_FFFFFF,
          fontSize: 24.sp,
          fontWeight: FontWeight.w800));
  static final textStyle1_ = GoogleFonts.signika(
      textStyle: TextStyle(
          color: AppColorss.c_9745FF,
          fontSize: 24.sp,
          fontWeight: FontWeight.w800));

  static final textStyle2 = GoogleFonts.signika(
    textStyle: TextStyle(
        color: AppColorss.c_000000,
        fontSize: 26.sp,
        fontWeight: FontWeight.w600),
  );
  static final textStyle4 = GoogleFonts.signika(
      textStyle: TextStyle(
          color: AppColorss.c_C8C8C8,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700));
  static final textStyle3 = GoogleFonts.lato(
    textStyle: TextStyle(
        color: AppColorss.c_C8C8C8,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400),
  );
  static final textStyle5 = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColorss.c_000000,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
  );
  static final textStyle6 = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColorss.c_8F00FF,
      fontSize: 14.sp,
    ),
  );
}
