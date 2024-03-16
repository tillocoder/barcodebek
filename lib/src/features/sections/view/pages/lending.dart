import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/sections/controller/bosilganda.dart';
import 'package:barcodbek/src/features/sections/view/pages/Deptors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int index1 = 0;

class LendingPages extends ConsumerWidget {
  const LendingPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var con = ref.read(deptorsController);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(
            children: [
              const WBeacButton(
                isChec: true,
                title: "Qarz Berish",
              ),
              const Spacer(),
              const Column(
                children: [
                  WTextFild(
                    hintText: "Ismi / Familiyasi",
                  ),
                  WGap.gap20,
                  WTextFild(hintText: "Telefon raqami"),
                  WGap.gap20,
                  WTextFild(hintText: "Olgan mahsulotlari"),
                  WGap.gap20,
                  WTextFild(hintText: "Olgan mahsulotlari"),
                ],
              ),
              const Spacer(
                flex: 6,
              ),
              WElevatedButton(
                text: "Saqlash",
                onPressed: () {
                  con.isChecked.add(con.isChecked[index1]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeptorsPages(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
