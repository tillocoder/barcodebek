import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';

final deleteProductController = ChangeNotifierProvider.autoDispose((ref) => DeleteProduct());

class DeleteProduct extends ChangeNotifier {
  Dio dio = Dio(Baseoption.baseOptions);

  Future<void> deleteProduct(int barcode, int index) async {
    try {
      final response = await dio.delete('${Urls.deleteProducts}$barcode/');
      debugPrint('Delete API: ${Urls.deleteProducts}$barcode/');

      if (response.statusCode == 204) {
        // Product successfully deleted
        boxProduct.deleteAt(index);
        listtt.removeAt(index);
        notifyListeners();
        debugPrint('Product deleted successfully');
      } else {
        // Handle other status codes
        debugPrint('Failed to delete product. Status code: ${response.statusCode}');
        // You may choose to handle different status codes differently
        // For now, let's remove the product from the local list even if the server deletion failed
        boxProduct.deleteAt(index);
        listtt.removeAt(index);
        notifyListeners();
      }

      // Also, delete from cache regardless of server response
      boxProductCache.deleteAt(index);
    } catch (error) {
      // Handle Dio errors
      debugPrint('Dio error: $error');
      // You can choose to display an error message to the user
      // or handle the error in another appropriate way
    }
  }
}
