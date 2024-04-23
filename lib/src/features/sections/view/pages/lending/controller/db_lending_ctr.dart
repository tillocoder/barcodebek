import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lendingController = ChangeNotifierProvider.autoDispose((ref) => LendingController());

class LendingController extends ChangeNotifier {

  final ismFamilya = TextEditingController();
  final phoneNumber = TextEditingController();
  final qoshimcha = TextEditingController();



}
