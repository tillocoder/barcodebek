import 'package:barcodbek/src/data/entity/qarzdor_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final lendingController = ChangeNotifierProvider.autoDispose((ref) => LendingController());

class LendingController extends ChangeNotifier {
  LendingController() {
    openbox();
  }
  final ismFamilya = TextEditingController();
  final phoneNumber = TextEditingController();
  final qoshimcha = TextEditingController();
  final berishmuddati = TextEditingController();
  late Box debtorbox;
  void openbox() async {
    debtorbox = await Hive.openBox('debtors');
  }

  void addData(UserDeptors model) {
    debtorbox.add(model);
  }

  void removeData(index) {
    debtorbox.values.toList().removeAt(index);
  }
}
