import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/data/entity/qarzdor_user.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/sections/controller/bosilganda.dart';
import 'package:barcodbek/src/features/sections/view/pages/Deptors.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/controller/calendar_ctr.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/controller/db_lending_ctr.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/view/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int index1 = 0;

class LendingPages extends ConsumerWidget {
  const LendingPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var con = ref.read(deptorsController);
    var ctrlending = ref.read(lendingController);
    var ctrcalendar = ref.read(calendarController);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Column(
              children: [
                WBeacButton(
                  isChec: true,
                  title: Words.lending.tr(context),
                ),
                WGap.gap15,
                Column(
                  children: [
                    WTextFild(
                      controller: ctrlending.ismFamilya,
                      hintText: Words.name_surname.tr(context),
                    ),
                    WGap.gap20,
                    WTextFild(controller: ctrlending.phoneNumber, hintText: Words.phone_number.tr(context)),
                    WGap.gap20,
                    WTextFild(controller: ctrlending.qoshimcha, hintText: Words.received_products.tr(context)),
                    WGap.gap10,
                    const Calendar(),
                    WGap.gap10
                  ],
                ),
                WElevatedButton(
                  text: Words.save.tr(context),
                  onPressed: () {
                    String qarzmuddati;
                    if (ctrcalendar.rangeEnd != null) {
                      qarzmuddati = ctrcalendar.rangeEnd.toString();
                    } else {
                      qarzmuddati = ctrcalendar.focusedDay.toString();
                    }
                    UserDeptors model = UserDeptors(
                      ismFamilya: ctrlending.ismFamilya.text,
                      phoneNumber: ctrlending.phoneNumber.text,
                      qoshimcha: ctrlending.qoshimcha.text,
                      berishmuddati: qarzmuddati,
                    );
                    con.isChecked.add(false);
                    boxdeptors.add(model);
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
      ),
    );
  }
}
