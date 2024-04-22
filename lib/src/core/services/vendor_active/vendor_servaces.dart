import 'package:barcodbek/src/core/services/AppUrls/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class VendorServices {
  static Dio dio = Dio();

  static Future<void> POST(String phoneNumber) async {


      debugPrint("Posting data...");
      var response = await dio.post("http://142.93.180.85/users/vendor-confirmation/", data: {
        "phone_number": '+998992665565',
        "confirm": 'true'
      });

      debugPrint("Response Status Code: ${response.statusCode}");
      debugPrint("Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Vendor data posted successfully");
        return response.data;
      } else {
        debugPrint("Error occurred: ${response.statusCode}");
      }

  }
}
