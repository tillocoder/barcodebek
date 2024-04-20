import 'package:barcodbek/src/core/services/debtors/post_services.dart';
import 'package:barcodbek/src/data/entity/debtor_user_model.dart';
import 'package:barcodbek/src/data/entity/products_model.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/controller/db_lending_ctr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/profile/view/pages/edit_profile/controller/edit_controller.dart';
import 'package:barcodbek/src/features/profile/view/pages/savdo_tarixi/view/pages/statistic_page.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/view/pages/lending.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:barcodbek/src/features/sections/view/widgets/weleavtedbutton.dart';

class WCustomBottomNav extends ConsumerWidget {
  final Key? key;

  const WCustomBottomNav({
    this.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellctr = ref.read(sellController);
    // var ctrlending = ref.read(lendingController);
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
                  backgroundColor:
                      sellctr.egalik != null && sellctr.egalik == true
                          ? AppColorss.c_8F00FF
                          : AppColorss.c_707070,
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
                  backgroundColor:
                      sellctr.egalik != null && sellctr.egalik == false
                          ? AppColorss.c_8F00FF
                          : AppColorss.c_707070,
                  text: "Selling",
                  onPressed: () {
                    sellctr.onTap(false);
                    String data =
                        DateTime.now().toIso8601String().substring(0, 10);
                    final taxrixModel = TaxrixMadel(
                      data: data,
                      praduct: sellctr.savat,
                    );
                    sellctr.umumisuma();
                    debugPrint(taxrixModel.praduct.toString());
                    a.addAll(taxrixModel.praduct);
                    savdoList.add(taxrixModel);
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

List<ProductsModel> a = [];
