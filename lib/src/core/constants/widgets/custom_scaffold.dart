import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: Image.asset("assets/images/background.jpeg").image,
      )),
      child: child,
    );
  }
}
