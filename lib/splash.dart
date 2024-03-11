import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPages extends StatelessWidget {
  const SplashPages({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(child: Text("alik",style: GoogleFonts.aBeeZee(fontSize:20.sp ),),),
    );
  }
}
