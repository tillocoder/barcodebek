import 'package:flutter/material.dart';

class WText extends StatelessWidget {
  final String? data;
  final TextStyle? style;

  const WText(
    this.data, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: style,
    );
  }
}
