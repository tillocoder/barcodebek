import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/debtors_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GetDebtorsServices extends ChangeNotifier {
  static Dio dio = Dio(Baseoption.baseOptions);

  static List<Debtors> model1 = [];

  static Future<void> GET() async {
    debugPrint("salom");
    try {
      debugPrint("alik");
      var responseData = await dio.get(Urls.getDebTors);
      debugPrint("salom");
      if (responseData.statusCode == 200 || responseData.statusCode == 201) {
        debugPrint("if ga krdi");
        debugPrint(responseData.statusCode.toString());
        debugPrint("salommm ${responseData.data}");
        model1 = (responseData.data as List).map((e) => Debtors.fromJson(e)).toList();
        debugPrint("Parsed model: ${model1.length}");
        return responseData.data;
      } else {
        debugPrint("Unexpected status code: ${responseData.statusCode}");
      }
    } catch (e) {
      debugPrint("Error salom: $e");
    }
  }
}