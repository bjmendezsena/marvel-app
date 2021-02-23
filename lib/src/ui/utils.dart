import 'package:flutter/material.dart';
import 'package:marvel_app/src/models/Thumbnail.dart';

Widget circularProgressIndicator() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: Colors.white,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    strokeWidth: 3,
  ));
}

String getImagePath(Thumbnail thumbnail){
  final portrait = 'portrait_uncanny';
  return '${thumbnail.path}/${portrait}.${thumbnail.extension}';
}
