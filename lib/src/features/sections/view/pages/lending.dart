import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:flutter/material.dart';

class LendingPages extends StatelessWidget {
  const LendingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              WBeacButton(
                isChec: true,
                title: "Qarz Berish",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
