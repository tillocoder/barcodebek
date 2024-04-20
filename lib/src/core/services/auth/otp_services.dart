import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class OTPServices{
  static Dio dio =Dio();
  static Future<void> POST(Map<String,dynamic> data, BuildContext context) async {
    var response = await dio.post('${Urls.baseUrl}${Urls.otp}', data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('CODEE: ${response.statusCode.toString()}');
      debugPrint('CODEE: ${data.toString()}');
      debugPrint('MASSENGE: ${response.statusMessage.toString()}');
      return response.data;
    } else {
      var responseData = response.data as Map<String, dynamic>;
      String? accessToken = responseData["message"] as String?;
      debugPrint('MASSENGE: $accessToken');
    }
  }
}