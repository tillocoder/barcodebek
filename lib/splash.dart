import 'package:barcodbek/src/future/home/view/pages/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(child: Text("alik",style: GoogleFonts.aBeeZee(fontSize:20.sp ),),),
    );
  }
}
