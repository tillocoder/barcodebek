import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:flutter/material.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          WBeacButton(
            title: 'Sotuvchilarim',
          ),
        ],
      ),
    );
  }
}
