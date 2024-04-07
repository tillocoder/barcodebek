import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:flutter/material.dart';

class Keraksiz extends StatelessWidget {
  const Keraksiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (contex, index) {
              return ListTile(
                title: Text(
                  "saloskds",
                  style: AppTextStyle.textStyle1_,
                ),
              );
            }),
      ),
    );
  }
}
