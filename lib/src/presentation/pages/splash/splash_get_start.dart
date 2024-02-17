import 'package:barcodbek/src/presentation/pages/home_page/home_screen.dart';
import 'package:flutter/material.dart';

class SplashGetStart extends StatelessWidget {
  const SplashGetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Text(
              'BARCODBEK',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff9745FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/images_png/barcodebek_3d.jpeg'),
            const Text(
              'Yordamchi',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Text(
                'Mengga mahsulotlar narxini jonating va men uni saqlab olaman, hohlagan paytda mahsulotlaringiz narxini aniqlay olasiz',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (build) => const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: const Color.fromARGB(255, 114, 6, 255),
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: const Color(0xff9745FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Boshlash',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
