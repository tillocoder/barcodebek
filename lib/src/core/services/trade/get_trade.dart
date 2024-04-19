import 'dart:convert';

import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/user_get_trade.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetTradeServices extends ChangeNotifier {
  
  static Dio dio = Dio(Baseoption.baseOptions);

  static List<UserGetTrade> list = [];

  static Future<void> get() async {
    debugPrint('Serverdan');

    list.clear();
    var responseData = await dio.get(Urls.gettrade);
    if (responseData.statusCode == 200 || responseData.statusCode == 201) {
      dynamic data = responseData.data;
      if (data is List) {
        list = userGetTradeFromJson(jsonEncode(data));
        debugPrint(list.toString());
      } else {
        // Serverdan kelgan ma'lumotlar JSON ro'yxat emas
        debugPrint('Serverdan kelgan ma\'lumotlar JSON ro\'yxat emas');
      }
    } else {
      // Serverdan ma'lumotlarni olishda xatolik
      debugPrint('Serverdan ma\'lumotlarni olishda xatolik: ${responseData.statusCode}');
    }
  }
}
