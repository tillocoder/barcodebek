import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class WTextFild extends StatelessWidget {
  final String hintText;
  final String iconPath;

  const WTextFild({
    super.key,
    required this.hintText,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      borderOnForeground: true,
      shadowColor: const Color(0xFFC8C8C8),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              iconPath,
              height: 12,
              width: 14,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromRGBO(200, 200, 200, 1)),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}
