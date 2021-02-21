import 'package:marvel_app/src/pages/screens/HomeScreen.dart';
import 'package:marvel_app/src/pages/screens/SettingsScreen.dart';
import 'package:marvel_app/src/pages/screens/SupportScreen.dart';

const HERO_TAG_LOGO = 'LOGO';

final menuItems = [
  {
    'label': 'home_page',
    'screen': HomeScreen(),
  },
  {
    'label': 'settings_page',
    'screen': SettingsScreen(),
  },
  {
    'label': 'support_page',
    'screen': SupportScreen(),
  },
];
