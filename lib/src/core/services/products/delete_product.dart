import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteproductController = ChangeNotifierProvider.autoDispose((ref) => DeleteProduct());

class DeleteProduct extends ChangeNotifier {
  Dio dio = Dio(Baseoption.baseOptions);

  Future<void> deleteProduct(BuildContext context, int barcode, int index) async {
    var responsData = await dio.delete('${Urls.deleteProducts}$barcode/');
    debugPrint('Delete API :${Urls.deleteProducts}$barcode/');
    if (responsData.statusCode == 204||responsData.statusCode ==201|| responsData.statusCode ==200) {
      boxProduct.deleteAt(index);
      listtt.removeAt(index);
      notifyListeners();
      debugPrint(responsData.statusCode.toString());
    } else {
      debugPrint(responsData.statusCode.toString());
       boxProduct.deleteAt(index);
      listtt.removeAt(index);
    }

           boxProduct.deleteAt(index);
           boxProductCache.deleteAt(index);
      listtt.removeAt(index);
    notifyListeners();
  }
}
