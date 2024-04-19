import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/products/get_products.dart';
import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:barcodbek/src/core/services/trade/get_trade.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/data/entity/user_get_model.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthLoginServices {
  static List<UserGetData> commentslist = [];

  // Fixed endpoint
  static String tokenn = boxToken.get('tokenn') ?? '';

  static BaseOptions getCommetOptions = BaseOptions(
    baseUrl: Urls.baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': // Fixed token header
          'Bearer $tokenn',
    },
    connectTimeout: const Duration(seconds: 4),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  static Dio userget = Dio(getCommetOptions);
  static Dio token = Dio();
  static String number = (boxToken.get('number') ?? '').substring(4);

  static Future<void> getData() async {
    var response = await userget.get('${Urls.userGetApi}$number/');
    debugPrint('DATA${response.data}');
    debugPrint('DATA${Urls.baseUrl}${Urls.userGetApi}$number/');

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('TOKK$tokenn');
      var responseData = response.data;
      if (responseData is List) {
        commentslist = responseData.map((e) => UserGetData.fromJson(e)).toList();
        await boxUser.put('user', commentslist[0]);
        SellerGetServices.sellerGetData();
        GetProductServices.get();

        AuthConttroler actr = AuthConttroler();

        // String? ega = boxUser.get('user')?.type ?? '';
        // actr.logintap(ega);
        debugPrint('LENGTH : ${actr.length.toString()}');
        debugPrint('Model: ${boxUser.get('user') ?? ''}');
        debugPrint('LIST: ${commentslist.toString()}');
      }
    } else {
      return;
    }
  }

  static Future<void> getToken(
    AuthLoginModel data,
  ) async {
    debugPrint(boxToken.get('tokenn').toString());
    debugPrint(boxToken.get('number').toString());
    debugPrint(boxUser.get('user').toString());
    debugPrint(boxProduct.clear().toString());
    try {
      var response = await token.post('${Urls.baseUrl}${Urls.postToken}', data: data.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = response.data as Map<String, dynamic>;
        String? accessToken = responseData["access"] as String?;
        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          await boxToken.put('tokenn', accessToken);
          listtt.clear();
          boxProductCache.clear();
          await AuthLoginServices.getData();
         await GetTradeServices.get();
        } else {
          return;
        }
      } else {
        return;
      }
    } catch (e) {
      return;
    }
  }
}
