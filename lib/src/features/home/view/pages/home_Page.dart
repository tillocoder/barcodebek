import 'dart:async';
import 'dart:math';

import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/home/view/widgets/best_vendor.dart';
import 'package:barcodbek/src/features/home/view/widgets/data.dart';
import 'package:barcodbek/src/features/home/view/widgets/performance.dart';
import 'package:barcodbek/src/features/home/view/widgets/w_card.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../widgets/w_card_1.dart';

///Important Informations
String marketName = 'Rizq Market';
bool userT = true;
List<Map> list = [
  {
    'name': 'Davlat',
    'amount': '15000000',
  },
  {
    'name': 'Alpomish',
    'amount': '210000000',
  },
  {
    'name': 'Hikmatilla',
    'amount': '2000000',
  },
  {
    'name': 'Asliddin',
    'amount': '1000000',
  },
  {
    'name': 'Davlat',
    'amount': '15000000',
  },
  {
    'name': 'Alpomish',
    'amount': '210000000',
  },
  {
    'name': 'Hikmatilla',
    'amount': '2000000',
  },
  {
    'name': 'Asliddin',
    'amount': '1000000',
  }
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final rdm = Random();

  List<Map> barAnimData = [];

  final priceVolumeStream = StreamController<GestureEvent>.broadcast();

  final heatmapStream = StreamController<Selected?>.broadcast();

  bool rebuild = false;

  @override
  Widget build(BuildContext context) {
    return !userT
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 40,
              scrolledUnderElevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: AppIcons.notification,
              ),
              centerTitle: true,
              title: Text(
                marketName,
                style: AppTextStyle.textStyle1_,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      userT = !userT;
                      setState(() {});
                    },
                    icon: AppIcons.search)
              ],
            ),
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///!

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
                                    const BorderRadius.all(Radius.circular(10)),
                              )),
                              color: ColorEncode(
                                  variable: 'name', values: Defaults.colors10),
                              elevation: ElevationEncode(value: 5),
                              transition: Transition(
                                  duration: Duration(seconds: 2),
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
                        text1: 'Bugunggi qarzlar',
                        text2: '18800000',
                      ),
                    ),
                    WGap.gap20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WCard1(
                          text1: 'Savdoning umumiy hajmi',
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
                                    itemCount: list.length,
                                    itemBuilder: (context, index) =>
                                        hehe(list[index])),
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
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              // toolbarHeight: 40,
              scrolledUnderElevation: 0,
              // automaticallyImplyLeading: userT,
              leading: userT
                  ? IconButton(
                      onPressed: () {},
                      icon: AppIcons.notification,
                    )
                  : SizedBox.shrink(),
              centerTitle: true,
              title: Text(
                marketName,
                style: AppTextStyle.textStyle1_,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      userT = !userT;
                      setState(() {});
                    },
                    icon: AppIcons.search)
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WGap.gap20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WCard(text1: 'text1', text2: 'text2'),
                    ),
                    WGap.gap20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WCard(text1: 'text1', text2: 'text2'),
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
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    spreadRadius: 1)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  'Qarzdorlar ro\'yhati',
                                  style: AppTextStyle.textStyle4,
                                ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        hehe(list[index])),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    spreadRadius: 1)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  'Hamkasblar',
                                  style: AppTextStyle.textStyle4_,
                                ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        hehe(list[index])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    WGap.gap10,
                  ],
                ),
              ),
            ),
          );
  }
}
