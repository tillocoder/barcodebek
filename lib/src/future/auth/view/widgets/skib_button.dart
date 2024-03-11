import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/style/text_style.dart';

class SkipButton extends StatelessWidget {
  final String text;
  final bool isText;
  final Function()? onTap;
  final Widget child;

  const SkipButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isText,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          isText == true ? text : '',
          style: AppTextStyle.textStyle2,
        ),
        Gap(20.sp),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 72.w,
            height: 42.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: LinearGradient(
                  transform: GradientRotation(0.8.sp),
                  colors: const [
                    Color(0xFFC3E6FF),
                    Color(0xFF9745FF),
                  ],
                ),
              ),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
