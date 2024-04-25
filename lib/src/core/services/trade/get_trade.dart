import 'dart:convert';

import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/user_get_trade.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetTradeServices extends ChangeNotifier {
  static Dio dio = Dio(Baseoption.baseOptions);

  static List<UserGetTrade> list = [];
  static List<UserGetTrade> bugun = [];
  static List<UserGetTrade> kecha = [];

  static Future<void> get() async {
    debugPrint('Serverdan');

    list.clear();
    var responseData = await dio.get(Urls.gettrade);
    if (responseData.statusCode == 200 || responseData.statusCode == 201) {
      dynamic data = responseData.data;
      if (data is List) {
        list = userGetTradeFromJson(jsonEncode(data));
       for (var e in list) {
  if (e.createdAt.substring(0,2) == DateTime.now().day.toString()) {
    bugun.add(e); // Modifying 'list' while iterating over it
    debugPrint(bugun.length.toString());
  } else {
    list.add(e); // Modifying 'list' while iterating over it
  }
}
        debugPrint(DateTime.now().day.toString());
        debugPrint(list[0].createdAt.substring(0, 2));
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
