import 'package:barcodbek/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: KeyboardDismisser(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPages(),
        ),
      ),
    );
  }
}
