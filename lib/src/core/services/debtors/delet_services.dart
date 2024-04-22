import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deletedebtorsController =
    ChangeNotifierProvider.autoDispose((ref) => DeletDebTorsServices());

class DeletDebTorsServices extends ChangeNotifier {
  Dio dio = Dio(Baseoption.baseOptions);

  Future<void> deleteDebtors(
      BuildContext context, int id,int index) async {
    debugPrint("salom");
    debugPrint('Delete API :${Urls.postDebTors}$id/');

    var responsData = await dio.delete('${Urls.postDebTors + id.toString()}/');
    debugPrint(responsData.realUri.toString());

    if (responsData.statusCode == 204 ||
        responsData.statusCode == 201 ||
        responsData.statusCode == 200) {
      GetDebtorsServices.model1.removeAt(index);

      debugPrint("Deletion successful");
      notifyListeners();
    } else {
      debugPrint("Unexpected status code: ${responsData.statusCode}");
    }
  }
}
