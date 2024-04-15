import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Keraksiz extends StatefulWidget {
  const Keraksiz({super.key});

  @override
  State<Keraksiz> createState() => _KeraksizState();
}

class _KeraksizState extends State<Keraksiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await Servicess.getTokenku();
      }),
    );
  }
}
class Servicess {
  static Dio dio = Dio();

  static Future<void> getTokenku() async {
    try {
      debugPrint('salom');
      var response = await dio.post(
        'https://milliy-karaoke.onrender.com/accounts/token/',
        data: {'username': 'admin', 'password': 'qwer1234'}, // Fixed typo
      );
      debugPrint('akik');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = response.data as Map<String, dynamic>;
        String? accessToken = responseData["access"] as String?;
        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          // You might want to perform further operations here instead of returning
        } else {
          debugPrint('davlat');
          // Handle the case when the access token is null
        }
      } else {
        debugPrint('qalesan');
        // Handle the case when the status code is not 200 or 201
      }
    } catch (e) {
      debugPrint('nimagap');
      // Handle exceptions
    }
  }
}
