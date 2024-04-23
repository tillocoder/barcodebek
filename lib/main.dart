import 'package:barcodbek/app.dart';
import 'package:barcodbek/src/data/entity/user_get_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'src/data/entity/products_model.dart';

late Box<ProductsModel> boxProduct;
late Box<ProductsModel> boxProductCache;
late Box<String> boxToken;
late Box<UserGetData> boxUser;
late SharedPreferences prefs;
late Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  Hive.registerAdapter(UserGetDataAdapter());
  boxProduct = await Hive.openBox<ProductsModel>("Scanner");
  boxProductCache = await Hive.openBox<ProductsModel>("product");
  boxUser = await Hive.openBox<UserGetData>("user");
  boxToken = await Hive.openBox('Token');
  box = await Hive.openBox('boxUser');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
