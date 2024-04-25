import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/auth/auth_login_services.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/features/app_password/view/pages/app_password.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Confirmation extends ConsumerStatefulWidget {
  const Confirmation({super.key});

  @override
  ConfirmationState createState() => ConfirmationState();
}

class ConfirmationState extends ConsumerState<Confirmation> {
  @override
  void initState() {
    getToken();
    super.initState();
  }

  Future<void> getToken() async {
    AuthLoginModel authModel = AuthLoginModel(
        phoneNumber: box.get('number'), password: box.get('password'));
    debugPrint(authModel.toString());
    await AuthLoginServices.getToken(authModel);
    await AuthLoginServices.getData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const  AppPasswordPages()),
        (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Tasqlashdi kutig",
          style: AppTextStyle.textStyle1__,
        ),
      ),
    );
  }
}
