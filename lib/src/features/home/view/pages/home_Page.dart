import 'dart:async';
import 'dart:math';

import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/features/home/view/widgets/best_vendor.dart';
import 'package:barcodbek/src/features/home/view/widgets/performance.dart';
import 'package:barcodbek/src/features/home/view/widgets/w_card.dart';
import 'package:barcodbek/src/features/home/view/widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graphic/graphic.dart';

import '../widgets/w_card_1.dart';

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

  late Timer timer;

  final priceVolumeStream = StreamController<GestureEvent>.broadcast();

  final heatmapStream = StreamController<Selected?>.broadcast();

  bool rebuild = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.abc),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.abc))
        ],
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => setState(() {
      //         rebuild = true;
      //       }),
      //       child: const Icon(Icons.refresh),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (contex) => const HomePage(),
      //           ),
      //         );
      //       },
      //       child: const Icon(Icons.next_plan_outlined),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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

              WCard(
                text1: 'Bugunggi qarzlar',
                text2: '18800000',
              ),
              WGap.gap20,
              WCard(
                text1: 'Bugunggi qarzlar',
                text2: '18800000',
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
              Performance(list:list),
              WGap.gap20,
              BVendor(
                name: 'Davlat Salimov',
                capacity: 'Eng yaxshi sotuvchi',
              ),
              WGap.gap10
            ],
          ),
        ),
      ),
    );
  }
}
