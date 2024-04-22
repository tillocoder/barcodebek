// import 'package:barcodbek/src/core/services/debtors/post_services.dart';
// import 'package:barcodbek/src/data/entity/debtor_user_model.dart';
// import 'package:flutter/material.dart';
//
// class KKRRPP extends StatefulWidget {
//   const KKRRPP({super.key});
//
//   @override
//   State<KKRRPP> createState() => _KKRRPPState();
// }
//
// class _KKRRPPState extends State<KKRRPP> {
//   TextEditingController name = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController commit = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: Column(
//                   children: [
//                     TextField(
//                       controller: name,
//                     ),
//                     TextField(
//                       controller: phone,
//                     ),
//                     TextField(
//                       controller: commit,
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   IconButton(
//                     onPressed: () async {
//                       await PostDebTorsServices.POST(
//                         DebtorUser(
//                           fullName: name.text,
//                           phoneNumber: phone.text,
//                           products: [Product(barCode: 787099257798, number: 4)],
//                           comment: commit.text,
//                         ),
//                       );
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.save),
//                   )
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
