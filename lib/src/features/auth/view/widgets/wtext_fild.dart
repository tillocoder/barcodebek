import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class WTextFild extends StatelessWidget {
  final String hintText;
  final Widget? iconPath;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const WTextFild({
    super.key,
    required this.hintText,
    this.iconPath,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorss.c_FFFFFF,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(203, 203, 203, 100),
            offset: Offset(2, 2),
            blurRadius: 20,
            spreadRadius: 6,
          )
        ],
      ),
      child: SizedBox(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: iconPath != null
                ? Padding(
                    padding: const EdgeInsets.all(14),
                    child: iconPath ?? const SizedBox.shrink(),
                  )
                : null,
            hintText: hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: suffixIcon,
            ),
            hintStyle: const TextStyle(color: Color.fromRGBO(200, 200, 200, 1)),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}
