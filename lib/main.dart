import 'package:barcodbek/app.dart';
import 'package:barcodbek/src/data/entity/sacanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

late Box<ScannModelPrice> box;

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ScannModelPriceAdapter());
  box = await Hive.openBox<ScannModelPrice>("Scanner");
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
