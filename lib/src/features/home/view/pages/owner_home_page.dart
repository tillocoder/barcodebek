// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:barcodbek/keraksiz.dart';
import 'package:barcodbek/kk.dart';
import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/home/controller/homeController.dart';
import 'package:barcodbek/src/features/home/view/pages/vendor_home_page.dart';
import 'package:barcodbek/src/features/home/view/widgets/best_vendor.dart';
import 'package:barcodbek/src/features/home/view/widgets/data.dart';
import 'package:barcodbek/src/features/home/view/widgets/performance.dart';
import 'package:barcodbek/src/features/home/view/widgets/w_card.dart';
import 'package:barcodbek/src/features/home/view/widgets/w_card_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';

///Important Informations
bool userT = true;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var ctrhome = ref.watch(homeController);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool rebuild = false;
    ref.watch(homeController);
    var authCtr = ref.read(authConttroler);
    String? ega = boxUser.get('user')?.type ?? '';
    ega == 'Director' ? authCtr.egalik = false : authCtr.egalik = true;
    return !(authCtr.egalik!)
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: IconButton(
                onPressed: () async {

                 await GetDebtorsServices.GET();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => KeraksizPages()));
                },
                icon: AppIcons.notification,
              ),
              centerTitle: true,
              title: Text(
                boxUser.values.toList()[0].market,
                style: AppTextStyle.textStyle1_,
              ),
            ),
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 350,
                        height: 300,
                        child: Chart(
                          rebuild: rebuild,
                          data: tradeWeekData,
                          variables: {
                            'name': Variable(
                              accessor: (Map map) => map['name'] as String,
                            ),
                            'value': Variable(
                              accessor: (Map map) => map['value'] as num,
                              scale: LinearScale(min: 0, marginMax: 0.1),
                            ),
                          },
                          marks: [
                            IntervalMark(
                              label: LabelEncode(
                                  encoder: (tuple) =>
                                      Label(tuple['name'].toString())),
                              shape: ShapeEncode(
                                  value: RectShape(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(
                                        // MediaQuery.of(context).size.
                                        12)),
                              )),
                              color: ColorEncode(
                                  variable: 'name', values: Defaults.colors10),
                              elevation: ElevationEncode(value: 5),
                              transition: Transition(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.elasticOut),
                              entrance: {MarkEntrance.y},
                            )
                          ],
                          coord: PolarCoord(startRadius: 0.15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WCard(
                        text1: 'Bugunggi qarzlar',
                        text2: '18800000',
                      ),
                    ),
                    WGap.gap20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WCard(
                        text1: 'Undurilgan umumiy qarzlar',
                        text2: '188000',
                      ),
                    ),
                    WGap.gap20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WCard(
                        text1: 'Umumiy  qarzlar',
                        text2: '18800000',
                      ),
                    ),
                    WGap.gap20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WCard1(
                          text1: 'Savdoning umumiy hajmi ',
                          text2: '324000000',
                        ),
                        WGap.gap15,
                        WCard1(
                          text1: 'Bugunggi savdoning hajmi',
                          text2: '24400000',
                        ),
                      ],
                    ),
                    WGap.gap20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    spreadRadius: 6,
                                    blurRadius: 2,
                                    color: Color(0x50C293FF))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sotuvchilar',
                                      style: AppTextStyle.textStyle11a,
                                    ),
                                    Text(
                                      'Sotuvchining bugungi savdosi',
                                      style: AppTextStyle.textStyle11a,
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: ctrhome.list.length,
                                    itemBuilder: (context, index) =>
                                        hehe(ctrhome.list[index])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    WGap.gap20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: BVendor(
                        name: 'Davlat Salimov',
                        capacity: 'Eng yaxshi sotuvchi',
                      ),
                    ),
                    WGap.gap10
                  ],
                ),
              ),
            ),
          )
        : const VendorPage();
  }
}
