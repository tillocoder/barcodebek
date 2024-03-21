import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/textresponsive.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WBeacButton extends StatelessWidget {
  final String? title;
  final bool? isChec;

  const WBeacButton({super.key, this.title, this.isChec});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: isChec == true
                ? SizedBox(
                    width: 46,
                    height: 46,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColorss.c_F8F8FB,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColorss.c_D6BEFF,
                            blurRadius: 1,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: AppIcons.arrow_left,
                      ),
                    ),
                  )
                : const SizedBox.shrink()),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.headlineMedium,
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        const Gap(10),
      ],
    );
  }
}
