import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WTextFild extends StatelessWidget {
  final String hintText;
  final SvgPicture iconPath;
  final bool isSvg;

  const WTextFild({
    super.key,
    required this.hintText,
    required this.iconPath,
    required this.isSvg,
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
        height: 52,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.all(14),
                child: isSvg ? iconPath : const SizedBox.shrink()),
            hintText: hintText,
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
