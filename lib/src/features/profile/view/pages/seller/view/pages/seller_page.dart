import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:barcodbek/src/core/services/vendor_active/vendor_servaces.dart';
import 'package:barcodbek/src/data/entity/user_venndor_madel.dart';
import 'package:barcodbek/src/features/profile/view/pages/seller/controller/seller_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: const WText('Sotuvchilarim'),
          centerTitle: true,
          iconTheme:  IconThemeData(color: const Color(0xff9745FF)),
        ),
        body: ListView.builder(
          itemCount: SellerGetServices.seller.length,
          itemBuilder: (context, index) {
            // var userActive = SellerGetServices.seller[index].is_active;
            return MergeSemantics(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shadowColor: Colors.black,    
                  surfaceTintColor: Colors.white,
                  elevation: 8,
                  child: ListTile(
                    title: WText(SellerGetServices.seller[index].firstName),
                    subtitle: WText(SellerGetServices.seller[index].phoneNumber),
                    trailing: // Inside SellerPage widget
                        CupertinoSwitch(
                      value: ctr.userActive[index], // Use index to access the correct userActive value
                      onChanged: (value) async {
                        ctr.isactive(index, value); // Pass index to isactive method
                        UserVendorModel data = UserVendorModel(
                          phoneNumber: SellerGetServices.seller[index].phoneNumber,
                          confirm: value,
                        );
                        await VendorServices.post(data);
                        ctr.sellerget();
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
