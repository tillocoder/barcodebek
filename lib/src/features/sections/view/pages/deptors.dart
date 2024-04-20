import 'package:barcodbek/src/core/services/debtors/delet_services.dart';
import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_images.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/features/sections/controller/bosilganda.dart';
import 'package:barcodbek/src/features/sections/view/widgets/w_elwationbutton.dart';

class DeptorsPages extends ConsumerWidget {
  const DeptorsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(deptorsController);
    ref.watch(deletedebtorsController);
    var con = ref.read(deptorsController);
    var servicesControler = ref.read(deletedebtorsController);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  WBeacButton(
                    isChec: true,
                    title: Words.debtors.tr(context),
                  ),
                  WGap.gap25,
                  Expanded(
                    child: ListView.builder(
                      itemCount: GetDebtorsServices.model1.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Card(
                            margin: const EdgeInsets.all(8),
                            color: Colors.white,
                            elevation: 4,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  title: WText(GetDebtorsServices.model1.toList()[index].fullName),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        color: AppColorss.c_FFFFFF,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: WText(
                                            GetDebtorsServices.model1
                                                .toList()[index]
                                                .amount,
                                            style: AppTextStyle.textStyle6,
                                          ),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        color: AppColorss.c_FFFFFF,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        WText(
                                                          GetDebtorsServices
                                                              .model1
                                                              .toList()[index]
                                                              .fullName,
                                                          style: AppTextStyle
                                                              .textStyle1__,
                                                        ),
                                                        WText(
                                                          GetDebtorsServices
                                                              .model1
                                                              .toList()[index]
                                                              .amount,
                                                          style: AppTextStyle
                                                              .textStyle4,
                                                        ),
                                                        WText(
                                                          Words.is_it_paid
                                                              .tr(context),
                                                          style: AppTextStyle
                                                              .textStyle1__,
                                                        ),
                                                        WGap.gap20,
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            WShowElvationButton(
                                                              text: Words.yes
                                                                  .tr(context),
                                                              onTap: () async {
                                                                debugPrint(GetDebtorsServices.model1[index].fullName);
                                                                await servicesControler.deleteDebtors(context, GetDebtorsServices.model1[index].id,index);

                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            WGap.gap10,
                                                            WShowElvationButton(
                                                              text: Words.no
                                                                  .tr(context),
                                                              onTap: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: AppImages.chek,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: index < con.isChecked.length &&
                                          con.isChecked[index],
                                      // Check if index is within bounds
                                      child: Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: TextField(
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  borderSide: BorderSide.none,
                                                ),
                                                filled: true,
                                                fillColor: AppColorss.c_FFFFFF,
                                                hintText: Words.send_a_message
                                                    .tr(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: index < con.isChecked.length &&
                                          con.isChecked[index],
                                      // Check if index is within bounds
                                      child: Expanded(
                                        child: SizedBox(
                                          height: 46,
                                          child: WElevatedButton(
                                            text: Words.send.tr(context),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            con.isChecked.add(false);
                            con.onChang(index);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              con.bosliganda ? buildAlign() : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

Align buildAlign() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: AppImages.chek_,
  );
}
