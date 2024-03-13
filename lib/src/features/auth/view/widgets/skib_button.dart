import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';


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
        const Gap(20),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 72,
            height: 42,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  transform: GradientRotation(0.8),
                  colors: [
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
