import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:barcodbek/src/core/services/baseOptions/base_options.dart';
import 'package:barcodbek/src/data/entity/user_venndor_madel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class VendorServices {
  static Dio dio = Dio(Baseoption.baseOptions);

  static Future<void> post(UserVendorModel data) async {
    debugPrint(data.toString());
    try {
      
          debugPrint("Vendor data posted successfully");
     
      var response = await dio.post(Urls.vendor, data: data.toJson());
           debugPrint("Vendor data posted successfully");

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Vendor data posted successfully");
        return response.data;
      } else {
        debugPrint("Error occurred: ${response.statusCode}");
        // Handle the error here, for example:
        throw Exception('Failed to post vendor data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors
      debugPrint("Dio error occurred: $e");
      throw Exception('Failed to post vendor data: $e');
    }
  }
}
