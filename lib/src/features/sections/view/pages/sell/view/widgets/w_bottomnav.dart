import 'package:barcodbek/src/core/services/trade/post_trade.dart';
import 'package:barcodbek/src/data/entity/user_post_trade.dart';
import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/profile/view/pages/savdo_tarixi/view/pages/statistic_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/view/pages/lending.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:barcodbek/src/features/sections/view/widgets/weleavtedbutton.dart';

class WCustomBottomNav extends ConsumerWidget {
  const WCustomBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sellController);
    final sellctr = ref.read(sellController);
    ref.watch(scannController);
    final scanctr = ref.read(scannController);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppTextStyle.textStyle4,
              ),
              Text(
                sellctr.umumisuma(),
                style: AppTextStyle.textStyle1_,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: WElevatedButton1(
                  backgroundColor: sellctr.egalik != null && sellctr.egalik == true ? AppColorss.c_8F00FF : AppColorss.c_707070,
                  text: "Lending",
                  onPressed: () async {
                    sellctr.onTap(true);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LendingPages(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: WElevatedButton1(
                  backgroundColor: sellctr.egalik != null && sellctr.egalik == false ? AppColorss.c_8F00FF : AppColorss.c_707070,
                  text: "Selling",
                  onPressed: () async {
                    List<Product> productModel = [];
                    for (var i = 0; i < sellctr.savat.length; ++i) {
                      productModel.add(
                        Product(
                          barCode: sellctr.savat[i].barCode,
                          number: sellctr.count[i],
                        ),
                      );
                    }
                    UserPostTrade data = UserPostTrade(product: productModel);
                    if (await PostTradeServices.post(data)) {
                      sellctr.savat.clear();
                      sellctr.savatBarcode.clear();
                      scanctr.barcodlar.clear();
                      sellctr.count.clear();
                    } else {

                    }
                    sellctr.onTap(false);
                    sellctr.umumisuma();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SavdoTarixPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
