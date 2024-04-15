import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/products_model.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetProductServices extends ChangeNotifier {
  static Dio dio = Dio(Baseoption.baseOptions);

  static List<ProductsModel> model = [];

  static Future<void> get() async {
    boxProduct.clear();
    var responsData = await dio.get(Urls.getProducts);
    if (responsData.statusCode == 200 || responsData.statusCode == 201) {
      model = (responsData.data as List).map((e) => ProductsModel.fromJson(e)).toList();
      debugPrint(model.toString());
      await boxProduct.addAll(model);
      listtt.insertAll(0, boxProduct.values);
      return responsData.data;
    } else {}
  }
}
