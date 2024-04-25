import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetController =
    ChangeNotifierProvider.autoDispose((ref) => InternetCheker());

class InternetCheker extends ChangeNotifier {
  List<ConnectivityResult> status = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late bool tekshirdim;

  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    status = result;
    debugPrint('INTERNET :${tekshirdim = status[0].toString() == 'ConnectivityResult.none' ? false : true} $status');
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
