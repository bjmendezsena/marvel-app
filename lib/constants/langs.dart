import 'package:flutter/material.dart';

List<Locale> get localeConfigurations {
  List<Locale> result = lengageSuported.map((e) => Locale(e)).toList();

  return result;
}

List<String> lengageSuported = ['en', 'es'];
