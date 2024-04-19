// import 'package:barcodbek/src/core/services/trade/get_trade.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Keraksiz extends StatefulWidget {
//   const Keraksiz({Key? key}) : super(key: key);

//   @override
//   State<Keraksiz> createState() => _KeraksizState();
// }

// class _KeraksizState extends State<Keraksiz> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: GetTradeServices.list.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(GetTradeServices.list[index].totalAmount),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await GetTradeServices.get();
//           setState(() {}); // Ma'lumotlar yangilandi
//         },
//       ),
//     );
//   }
// }

