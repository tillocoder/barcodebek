import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_images.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:barcodbek/src/features/sections/controller/bosilganda.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeptorsPages extends ConsumerWidget {
  const DeptorsPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(deptorsController);
    var con = ref.read(deptorsController);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  const WBeacButton(
                    isChec: true,
                    title: 'Qarzdorlar',
                  ),
                  WGap.gap25,
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          index1 = index;
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
                                    title: const Text("Mirzo Aliyev"),
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
                                            child: Text(
                                              "125.000 sum",
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
                                            child: AppImages.chek,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: con.isChecked[index],
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
                                                        BorderRadius.circular(
                                                            14),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      AppColorss.c_FFFFFF,
                                                  hintText:
                                                      "Qarzini ertaga berib ket",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      WGap.gap15,
                                      Visibility(
                                        visible: con.isChecked[index],
                                        child: Expanded(
                                          child: SizedBox(
                                            height: 46,
                                            child: WElevatedButton(
                                              text: "Yuborish",
                                              onPressed: () {
                                                con.onTap(true);
                                                Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () {
                                                    con.onTap(false);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomePage(),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
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
                              con.onChang(index);
                            },
                          );
                        },
                        itemCount: con.isChecked.length,
                      ),
                    ),
                  )
                ],
              ),
              con.bosliganda ? buildAlign() : const Text("salom")
            ],
          ),
        ),
      ),
    );
  }

  Align buildAlign() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AppImages.chek_,
    );
  }
}
