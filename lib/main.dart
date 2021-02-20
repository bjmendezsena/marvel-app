import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'configurations/MarvelLocalizations.dart';
import 'constants/langs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Marvel App'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
      supportedLocales: localeConfigurations,
      localizationsDelegates: [
        MarvelLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
