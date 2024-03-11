import 'package:flutter/material.dart';

class WPadding extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  const WPadding({
    super.key,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
