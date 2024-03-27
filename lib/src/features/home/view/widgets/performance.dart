import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Performance extends StatelessWidget {
  List<Map> list;
  Performance({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow:const [
               BoxShadow(
                  spreadRadius: 6, blurRadius: 2, color: Color(0x50C293FF))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sotuvchilar',style: AppTextStyle.textStyle11a,),
                  Text('Sotuvchining bugungi savdosi',style: AppTextStyle.textStyle11a,),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

SizedBox hehe(Map map) {
  return  SizedBox(
    child: Column(
      children: [
        WGap.gap10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(map['name'] ,style: AppTextStyle.textStyle4,),
            Text('${map['amount']} sum',style: AppTextStyle.textStyle11a,),
          ],
        ),
      const  Divider(
          color: Color(0xFFAF72FE),
        )
      ],
    ),
  );
}

SizedBox haha(Map map) {
  return  SizedBox(
    child: Column(
      children: [
        WGap.gap10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(map['name'] ,style: AppTextStyle.textStyle4,),
            Row(mainAxisSize:MainAxisSize.min,
              children: [
                Text(map['degree']??'',style: AppTextStyle.textStyle11a,),
                WGap.gap10,
                map['degree']==null?const SizedBox.shrink():const Icon(Icons.error,color: Colors.red,)
              ],
            ),
          ],
        ),
        const  Divider(
          color: Color(0xFFAF72FE),
        )
      ],
    ),
  );
}