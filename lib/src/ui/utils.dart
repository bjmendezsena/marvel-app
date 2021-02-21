import 'package:flutter/material.dart';

Widget circularProgressIndicator() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: Colors.black,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    strokeWidth: 1,
  ));
}
