import 'package:barcodbek/src/core/local/app_local.dart';
import 'package:flutter/material.dart';

extension Mywords on Words {
  String tr(BuildContext context) => AppLocalization.of(context).tr(name);
}

enum Words {
  setting,
}
