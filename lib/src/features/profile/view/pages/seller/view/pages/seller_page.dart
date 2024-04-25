import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:barcodbek/src/core/services/vendor_active/vendor_servaces.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/data/entity/user_venndor_madel.dart';
import 'package:barcodbek/src/features/profile/view/pages/seller/controller/seller_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellerPage extends ConsumerWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sellerController);
    var ctr = ref.read(sellerController);
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1), () {
          ctr.sellerget();
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: WBeacButton(
                  isChec: true,
                  title: 'Sotuvchilarim',
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: SellerGetServices.seller.length,
                    itemBuilder: (context, index) {
                      return MergeSemantics(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shadowColor: Colors.black,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 8,
                            child: ListTile(
                              title: WText(
                                SellerGetServices.seller[index].firstName,
                                style: AppTextStyle.textStyle1__,
                              ),
                              subtitle: WText(
                                SellerGetServices.seller[index].phoneNumber,
                                style: AppTextStyle.textStyle4,
                              ),
                              trailing: // Inside SellerPage widget
                                  boxUser.get('user')?.type == 'Director'
                                      ? CupertinoSwitch(
                                          value: ctr.userActive[index],
                                          onChanged: (value) async {
                                            ctr.isactive(index, value);
                                            UserVendorModel data =
                                                UserVendorModel(
                                              phoneNumber: SellerGetServices
                                                  .seller[index].phoneNumber,
                                              confirm: value,
                                            );
                                            await VendorServices.post(data);
                                            ctr.sellerget();
                                          },
                                        )
                                      :   SellerGetServices.seller[index].type == 'Director'
                                          ? const Icon(
                                              Icons.star,
                                              color: AppColorss.c_9745FF,
                                            )
                                          : const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
