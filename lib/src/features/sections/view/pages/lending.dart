import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
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
              WBeacButton(
                isChec: true,
                title: Words.lending.tr(context),
              ),
              const Spacer(),
              Column(
                children: [
                  WTextFild(
                    hintText: Words.name_surname.tr(context),
                  ),
                  WGap.gap20,
                  WTextFild(hintText: Words.phone_number.tr(context)),
                  WGap.gap20,
                  WTextFild(
                    hintText: 'Qoshimcha',
                  ),
                ],
              ),
              const Spacer(
                flex: 8,
              ),
              WElevatedButton(
                text: Words.save.tr(context),
                onPressed: () {
                  con.isChecked.add(false);
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
