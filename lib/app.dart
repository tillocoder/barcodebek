import 'package:barcodbek/splash.dart';
import 'package:barcodbek/src/core/config/setting/inherted_locale.dart';
import 'package:barcodbek/src/core/config/setting/locale_controller.dart';
import 'package:barcodbek/src/core/local/app_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedLocalNotifier(
      localController: localController,
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: InheritedLocalNotifier.maybeOf(context)?.appLocale ??
              const Locale('ru', 'Ru'),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ru', 'RU'),
            Locale('uz', 'UZ'),
          ],
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: const SplashPages(),
        );
      }),
    );
  }
}
