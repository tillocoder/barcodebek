import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/app_url.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/data/entity/user_get_model.dart';
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
        commentslist =
            responseData.map((e) => UserGetData.fromJson(e)).toList();
        boxUser.put('user', commentslist[0]);
        debugPrint('Model: ${boxUser.get('user') ?? ''}');
        debugPrint('LIST: ${commentslist.toString()}');
      }
    } else {}
  }

  static Future<void> getToken(
    AuthLoginModel data,
  ) async {
    debugPrint(boxToken.get('tokenn').toString());
    debugPrint(boxToken.get('number').toString());
    debugPrint(boxUser.get('user').toString());
    try {
      var response = await token.post('${Urls.baseUrl}${Urls.postToken}',
          data: data.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = response.data as Map<String, dynamic>;
        String? accessToken = responseData["access"] as String?;
        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          await boxToken.put('tokenn', accessToken);
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
