import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';

Widget? snakebar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColorss.c_9745FF,
      content: Center(child: Text(text)),
    ),
  );
}
