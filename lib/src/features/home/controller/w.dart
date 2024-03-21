import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final homeController=ChangeNotifierProvider((ref) => HomeController());
class HomeController  extends ChangeNotifier{
void a(){notifyListeners();}
}