import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';

class WLanguageButton extends StatelessWidget {
  final String language;
  final Widget? iconFlag;
  final void Function()? onPressed;
  final Color? color;

  const WLanguageButton({
    super.key,
    required this.language,
    this.onPressed,
    this.color,
    this.iconFlag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColorss.c_9745FF, width: 2),
            borderRadius: BorderRadius.circular(14),
            color: color,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: iconFlag,
                  ),
                  WGap.gap15,
                  Text(
                    language,
                    style: AppTextStyle.textStyle10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
