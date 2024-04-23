import 'package:barcodbek/src/core/services/trade/get_trade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyController = ChangeNotifierProvider.autoDispose((ref) => HistoryController());

class HistoryController extends ChangeNotifier {
  HistoryController() {
    getHistory();
  }

  void getHistory() async {
    await GetTradeServices.get();
    notifyListeners();
  }
}
