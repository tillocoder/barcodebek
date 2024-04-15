import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/internetcheker/internet_cheker.dart';
import 'package:barcodbek/src/core/services/products/post_product.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/data/entity/products_model.dart';
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
    ref.watch(internetController);
    var internetCtr = ref.read(internetController);
    var postProductCtr = ref.read(postProduct);
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
                onPressed: () async {
                  debugPrint('\x1B[33m${'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'}\x1B[0m');
                  internetCtr.checkInternetConnection();

                  debugPrint('CHASHHHHHH: ${boxProductCache.values.length.toString()}');
                  ProductsModel model = ProductsModel(
                    barCode: int.parse(barcodeValue),
                    price: ctr.controllerPrice.text,
                    name: ctr.controllerName.text,
                    comment: ctr.controllerOther.text,
                    createdAt: DateTime.now().toString(),
                  );
                  if (boxProductCache.values.length > 2) {
                    // ignore: unrelated_type_equality_checks
                    if (internetCtr.status[0] != ConnectionState.none) {
                      ctr1.addCacheProduct(model);

                      await postProductCtr.postProduct();
                      Navigator.pop(context);
                    } else {
                      ctr1.addCacheProduct(model);
                      Navigator.pop(context);
                    }
                  } else {
                    ctr1.addCacheProduct(model);
                    Navigator.pop(context);
                  }
                  ctr.isCheck();
                  ctr.controllerName.clear();
                  ctr.controllerPrice.clear();
                  ctr.controllerOther.clear();
                  // ignore: use_build_context_synchronously
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
