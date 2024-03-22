import 'package:flutter/material.dart';

// ignore: body_might_complete_normally_nullable
Widget? snakebar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Barcode already scanned'),
    ),
  );
}
