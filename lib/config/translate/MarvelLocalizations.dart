

part of 'translate_config.dart';


class MarvelLocalizations {
  final String localeName;

  MarvelLocalizations(this.localeName);

  static const LocalizationsDelegate<MarvelLocalizations> delegate =
      _MarvelLocalizationsDelegate();

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

class _MarvelLocalizationsDelegate
    extends LocalizationsDelegate<MarvelLocalizations> {
  const _MarvelLocalizationsDelegate();

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
