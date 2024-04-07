import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/app_url.dart';
import 'package:barcodbek/src/data/entity/auth_login_model.dart';
import 'package:barcodbek/src/data/entity/auth_register_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthCreateServices {


  static BaseOptions postCommetOptions = BaseOptions(
    baseUrl: Urls.baseUrl,
    connectTimeout: const Duration(seconds: 4),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
  static Dio dio = Dio(postCommetOptions);

  //
  static Future<void> POST(AuthRegisterModel data, BuildContext context) async {
    var response = await dio.post(Urls.authResgsterApi, data: data.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('CODEE: ${response.statusCode.toString()}');
      debugPrint('CODEE: ${data.toString()}');
      debugPrint('MASSENGE: ${response.statusMessage.toString()}');
      return response.data;
    } else {}
  }


}
