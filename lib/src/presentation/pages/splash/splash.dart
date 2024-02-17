import 'dart:async';

import 'package:barcodbek/src/presentation/pages/splash/splash_get_start.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashGetStart()),
      );
    });

    return const Scaffold(
      backgroundColor: Color(0xff9745FF),
      bottomNavigationBar: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                'BARCODEBEK',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
