import 'dart:core';

import 'package:barcodbek/src/data/entity/sacanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellController = ChangeNotifierProvider((ref) => SellController());

class SellController extends ChangeNotifier {
  SellController() {
    savatGetBarcode();
  }

  List<ScannModelPrice> savat = [];
  List<String> savatBarcode = [];

  void savatAdd(ScannModelPrice data) {
    savat.add(data);
    savatGetBarcode();
    notifyListeners();
  }

  void savatGetBarcode() {
    for (var i = 0; i < savat.length; ++i) {
      savatBarcode.add(savat[i].barcode);
    }
    notifyListeners();
  }

  List<int> count = [];

  String umumisuma() {
    int totalSum = 0;
    for (int i = 0; i < savat.length; i++) {
      totalSum += int.parse(savat[i].price) * count[i];
    }
    return pricesCalculating(totalSum.toString());
  }

  String xotradagiSumma(String summa) {
    return pricesCalculating(summa.toString());
  }

  String pricesCalculating(String number) {
    String strNumber = number;
    String formattedNumber = '';
    int length = strNumber.length;
    for (int i = 0; i < length; i++) {
      if ((length - i) % 3 == 0 && i != 0) {
        formattedNumber += '.';
      }
      formattedNumber += strNumber[i];
    }
    return formattedNumber;
  }

  void oshuvchi(int index) {
    if (index < count.length) {
      count[index]++;
      notifyListeners();
    }
  }

  void kamayuvchi(
    int index,
  ) {
    if (count[index] != 0) {
      count[index]--;
      notifyListeners();
    } else {
      count.removeAt(index);
      savat.removeAt(index);
      notifyListeners();
    }
  }

  bool? egalik;

  void onTap(bool value) {
    egalik = value;
    notifyListeners();
  }
}
