import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetController = ChangeNotifierProvider.autoDispose((ref) => InternetCheker());

class InternetCheker extends ChangeNotifier {
  bool tekshirdim = false;
//? natija yuklanadi
  List<ConnectivityResult> status = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  //! tekshiruvchi
  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    status = result;
    debugPrint('INTERNET : ${ tekshirdim =  status[0]!=ConnectivityResult.none?true:false}');
    notifyListeners();
  }

//? natija ga buyruq
  void checkInternetConnection() async {
    try {
      List<ConnectivityResult> result = await _connectivity.checkConnectivity();
      updateConnectionStatus(result);
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
    }
    notifyListeners();
  }
}