import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BVendor extends StatelessWidget {
  String capacity;
  String name;

  BVendor({super.key, required this.capacity, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(spreadRadius: 2, blurRadius: 6, color: Color(0xFFECECEC)),
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 6,
              color: Color(0x50C293FF),
            )
          ],
        ),
        child: ListTile(
          title: Text(
            capacity,
            style: AppTextStyle.textStyle11a,
          ),
          subtitle: Text(
            name,
            style: AppTextStyle.textStyle4,
          ),
          trailing:const Icon(Icons.error,color: Colors.red,),
        ),
      ),
    );
  }
}
