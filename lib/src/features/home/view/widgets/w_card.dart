
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';

class WCard extends StatelessWidget {
  String text1;
  String text2;
   WCard({super.key,required this.text1,required this.text2});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 6,
                color: Color(0xFFECECEC)),
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 6,
              color: Color(0x50C293FF),
            )
          ],

        ),
        child: ListTile(
          leading: Text(text1,style: AppTextStyle.textStyle11a,),
          trailing: Text('$text2 sum',style: AppTextStyle.textStyle11n,),
        ),
      ),
    );
  }
}
