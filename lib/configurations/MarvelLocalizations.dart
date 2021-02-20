import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/constants/langs.dart';
import 'package:yaml/yaml.dart';

class MarvelLocalizations {
  final String localeName;

  MarvelLocalizations(this.localeName);

  static const LocalizationsDelegate<MarvelLocalizations> delegate =
      _DiskoverLocalizationsDelegate();

  YamlMap translations;

  Future load() async {
    String yamlString = await rootBundle.loadString('lang/${localeName}.yml');
    translations = loadYaml(yamlString);
  }

  dynamic t(String key) {
    try {
      var keys = key.split('.');
      dynamic translated = translations;

      keys.forEach((k) => translated = translated[k]);

      if (translated == null) {
        return 'Key not found: $key';
      }

      return translated;
    } catch (e) {
      return 'Key not found: $key';
    }
  }

  static MarvelLocalizations of(BuildContext context) {
    return Localizations.of<MarvelLocalizations>(context, MarvelLocalizations);
  }
}

class _DiskoverLocalizationsDelegate
    extends LocalizationsDelegate<MarvelLocalizations> {
  const _DiskoverLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return lengageSuported.contains(locale.languageCode);
  }

  @override
  Future<MarvelLocalizations> load(Locale locale) async {
    var t = new MarvelLocalizations(locale.languageCode);
    await t.load();
    return t;
  }

  @override
  bool shouldReload(LocalizationsDelegate<MarvelLocalizations> old) {
    return false;
  }
}
