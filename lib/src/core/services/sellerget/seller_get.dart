import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/data/entity/user_get_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../baseOptions/base_options.dart';

class SellerGetServices {
  static List<UserGetData> seller = [];
  static Dio dio = Dio(Baseoption.baseOptions);

  static Future<void> sellerGetData() async {
    Response result = await dio.get(Urls.apiSeller);
    debugPrint("${result.data}");
    seller = (result.data as List).map((e) => UserGetData.fromJson(e)).toList();
    debugPrint("${seller}");
  }
}
