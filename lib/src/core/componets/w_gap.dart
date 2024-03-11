import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WGap extends StatelessWidget {
  final double gap;
  const WGap({
    super.key,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return Gap(gap);
  }
}
