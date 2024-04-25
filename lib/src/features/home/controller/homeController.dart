// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeController());

class HomeController extends ChangeNotifier {
 
 List<Map> hList = [
  {'name': 'Davlat', 'degree': null},
  {'name': 'Alpomish', 'degree': null},
  {'name': 'Asliddin', 'degree': 'Eng yaxshi sotuvchi'},
  {'name': 'Hikmatilla', 'degree': 'Eng yaxshi sotuvchi'},
];

List<Map> list = [
  {'name': 'Davlat', 'amount': '15000000'},
  {'name': 'Alpomish', 'amount': '210000000'},
  {'name': 'Hikmatilla', 'amount': '2000000'},
  {'name': 'Asliddin', 'amount': '1000000'},
  {'name': 'Davlat', 'amount': '15000000'},
  {'name': 'Alpomish', 'amount': '210000000'},
  {'name': 'Hikmatilla', 'amount': '2000000'},
  {'name': 'Asliddin', 'amount': '1000000'}
];


 

}
