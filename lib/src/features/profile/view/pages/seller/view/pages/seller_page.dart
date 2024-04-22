import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:barcodbek/src/features/profile/view/pages/seller/controller/seller_controller.dart';
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
        ),
        body: ListView.builder(
          itemCount: SellerGetServices.seller.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: WText(SellerGetServices.seller[index].firstName),
              subtitle: WText(SellerGetServices.seller[index].phoneNumber),
            );
          },
        ),
      ),
    );
  }
}
