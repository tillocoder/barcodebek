import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/core/services/products/get_products.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProduct = ChangeNotifierProvider.autoDispose((ref) => PostPriductServices());

class PostPriductServices extends ChangeNotifier {
  Dio dio = Dio(Baseoption.baseOptions);

  //?post
  Future<void> postProduct() async {
    for (var data in boxProductCache.values) {
      var response = await dio.post(Urls.postProducts, data: data.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(boxProductCache.values.toList()[0].name);

        debugPrint('Status Code :${response.statusCode}');
      } else {
        var responseData = response.data as Map<String, dynamic>;
        String? massenge = responseData["massage"] as String?;
        debugPrint(massenge);
        debugPrint('Status Code :${response.statusCode}');
        return;
      }
    }
    await boxProductCache.clear();
    listtt.removeRange(boxProduct.values.length, boxProductCache.values.length);
    notifyListeners();

    await GetProductServices.get();
  }
}
