import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/data/entity/sacanner.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WDialog extends ConsumerWidget {
  const WDialog({
    super.key,
    required this.barcodeValue,
  });

  final String barcodeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var ctr = ref.read(scannController);
    ref.watch(pricesController);
    var ctr1 = ref.read(pricesController);
    box.get('scann');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Nomi',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabled: true,
            ),
            controller: ctr.controllerName,
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Narxi',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabled: true,
            ),
            controller: ctr.controllerPrice,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Qo\'shimcha',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabled: true,
            ),
            controller: ctr.controllerOther,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WOutlinedButton(
                text: "Qo'shish",
                barcodeValue: barcodeValue,
                onPressed: () {
                  debugPrint(context.toString());
                  ScannModelPrice model = ScannModelPrice(
                    barcode: barcodeValue,
                    price: ctr.controllerPrice.text,
                    name: ctr.controllerName.text,
                    dateTime: DateTime.now().toIso8601String().substring(0, 10),
                  );
                  ctr1.addProduct(model);
                  ctr.isCheck();
                  ctr.controllerName.clear();
                  ctr.controllerPrice.clear();
                  ctr.controllerOther.clear();
                  Navigator.pop(context);
                },
              ),
              WOutlinedButton(
                text: "Orqaga",
                barcodeValue: barcodeValue,
                onPressed: () {
                  ctr.isCheck();
                  ctr.controllerName.clear();
                  ctr.controllerPrice.clear();
                  ctr.controllerOther.clear();

                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const WOutlinedButton({
    super.key,
    required this.barcodeValue,
    this.onPressed,
    required this.text,
  });

  final String barcodeValue;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: AppColorss.c_FFFFFF,
        elevation: 2,
        shadowColor: AppColorss.c_707070,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.textStyle1__,
      ),
    );
  }
}
