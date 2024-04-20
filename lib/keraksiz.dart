import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:flutter/material.dart';

class KeraksizPages extends StatelessWidget {
  const KeraksizPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: GetDebtorsServices.model1.length,
        itemBuilder: (context, index) {
          return Text(GetDebtorsServices.model1[index].fullName);
        },
      ),
    );
  }
}
