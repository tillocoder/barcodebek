import 'package:barcodbek/src/data/entity/debtors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final lendingController = ChangeNotifierProvider.autoDispose((ref) => LendingController());

class LendingController extends ChangeNotifier {

  final ismFamilya = TextEditingController();
  final phoneNumber = TextEditingController();
  final qoshimcha = TextEditingController();



}
