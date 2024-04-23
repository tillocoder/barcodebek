import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/user_post_trade.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostTradeServices extends ChangeNotifier {
  static Dio dio = Dio(Baseoption.baseOptions);
  static Future<bool> post(UserPostTrade data) async {
    var responseData = await dio.post(Urls.gettrade, data: data);
    if (responseData.statusCode == 200 || responseData.statusCode == 201) {
      debugPrint('Status Code: ${responseData.statusCode}');
      return true;
    } else {
      debugPrint('Serverdan ma\'lumotlarni olishda xatolik: ${responseData.statusCode}');
    }
    return false;
  }
}
