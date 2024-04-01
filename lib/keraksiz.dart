import 'package:barcodbek/main.dart';
import 'package:flutter/material.dart';

class Keraksiz extends StatelessWidget {
  const Keraksiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: boxdeptors.values.toList().length,
        itemBuilder: (contex, index) {
        return ListTile(
          title: Text(boxdeptors.values.toList()[index].ismFamilya),
          subtitle: Text(boxdeptors.values.toList()[index].berishmuddati),
        );
      }),
    );
  }
}
