import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: body_might_complete_normally_nullable
Widget? snakebar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColorss.c_9745FF,
      content: Center(child: Text(text)),
    ),
  );
}
