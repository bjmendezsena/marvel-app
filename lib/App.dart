import 'package:marvel_app/src/routes/routes.dart';
import 'config/translate/translate_config.dart';
import 'src/constants/langs.dart';
import 'config/ui_config/ui_config.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Marvel App',
      routes: appRoutes,
      initialRoute: HOME_ROTE,
      supportedLocales: localeConfigurations,
      localizationsDelegates: DELEGATES,
    );
  }
}
