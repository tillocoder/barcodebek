import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/debtor_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PostDebTorsServices {
  static Dio dio = Dio(Baseoption.baseOptions);

  static Future<void> POST(DebtorUser data) async {
    var response = await dio.post(Urls.postDebTors, data: data.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {

      return response.data;
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
