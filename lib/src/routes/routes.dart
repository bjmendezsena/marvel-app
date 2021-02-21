import 'package:flutter/material.dart';
import 'package:marvel_app/src/pages/HomePage.dart';
part 'routes_constants.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  HOME_ROTE: (_) => HomePage()
};
