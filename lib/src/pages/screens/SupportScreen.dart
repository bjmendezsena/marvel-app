import 'package:marvel_app/config/translate/translate_config.dart';

import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  SupportScreen();

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    MarvelLocalizations localizations = MarvelLocalizations.of(context);
    return Center(
      child: Text(localizations.t('support_page'),
          style: Theme.of(context).textTheme.bodyText2),
    );
  }
}
