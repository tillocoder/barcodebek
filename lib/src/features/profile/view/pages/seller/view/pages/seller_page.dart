import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:flutter/material.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: WText('Sotuvchilarim'),
      ),
      body: ListView.builder(
        itemCount: SellerGetServices.seller.length,
          itemBuilder: (context,index){
        return ListTile(
          title: WText(SellerGetServices.seller[index].firstName),
        );
      })
    );
  }
}
