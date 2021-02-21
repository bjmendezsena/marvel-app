import 'package:flutter/material.dart';
import 'package:marvel_app/config/translate/translate_config.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    MarvelLocalizations localizations = MarvelLocalizations.of(context);
    return Center(
      child: Text(
        localizations.t('settings_page'),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
