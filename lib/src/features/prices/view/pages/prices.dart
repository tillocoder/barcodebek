import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricesPages extends StatelessWidget {
  const PricesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: WBeacButton(
                isChec: true,
                title: 'Narxlar',
              ),
            ),
            WGap.gap20,
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
                    child: Card(
                      shadowColor: const Color(0xff9745FF),
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '90000',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          title: const Text('Gurgut'),
                          subtitle: const Row(
                            children: [
                              Text(
                                '7324897293',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '10.20.2023',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Umumiy \n Mahsulotlarning Narxi",
                      style: AppTextStyle.textStyle5,
                      textAlign: TextAlign.center,
                    ),
                    WGap.gap10,
                    Text(
                      "113.500.000",
                      style: AppTextStyle.textStyle1__,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 80,
                      height: 30,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColorss.c_9745FF,
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              spreadRadius: 0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Yopish",
                            style: AppTextStyle.textStyle6,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
        child: AppIcons.sell,
      ),
    );
  }
}
