import 'package:flutter/material.dart';

class WText extends StatelessWidget {
  final String? data;
  final TextStyle? style;
  final TextAlign? align;

  const WText(
    this.data, {
    super.key,
    this.style,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: style,
    );
  }
}
