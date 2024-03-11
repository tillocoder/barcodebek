import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset("assets/images/background/background.jpeg").image,
        )),
        child: child,
      ),
    );
  }
}
