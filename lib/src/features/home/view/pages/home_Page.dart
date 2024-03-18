import 'dart:async';
import 'dart:math';

import 'package:barcodbek/src/features/profile/view/pages/savdo_tarixi/view/pages/controller/data.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => setState(() {
              rebuild = true;
            }),
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => const HomePage(),
                ),
              );
            },
            child: const Icon(Icons.next_plan_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                  data: roseData,
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
                      label: LabelEncode(encoder: (tuple) => Label(tuple['name'].toString())),
                      shape: ShapeEncode(
                          value: RectShape(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      )),
                      color: ColorEncode(variable: 'name', values: Defaults.colors10),
                      elevation: ElevationEncode(value: 5),
                      transition: Transition(duration: Duration(seconds: 2), curve: Curves.elasticOut),
                      entrance: {MarkEntrance.y},
                    )
                  ],
                  coord: PolarCoord(startRadius: 0.15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
