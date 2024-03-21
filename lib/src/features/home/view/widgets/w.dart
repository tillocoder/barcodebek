// import 'package:flutter/material.dart';
//
// class hehe extends StatelessWidget {
//   late TradeModel trade;
//    hehe({super.key, required this.trade});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(trade.dateTime),
//         Stack(
//           children: [
//             SizedBox(
//               height: 20,
//               width: 250,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: const Color(0xFFD6BEFF)),
//               ),
//             ),
//             Positioned(
//               child: SizedBox(
//                 height: 20,
//                 width: 250 * (24000 / 34000),
//                 child: DecoratedBox(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: const Color(0xFF9745FF))),
//               ),
//             )
//           ],
//         ),
//         Text(trade.tradeAmount)
//       ],
//     );
//   }
// }