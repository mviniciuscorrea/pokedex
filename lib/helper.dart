import 'package:flutter/material.dart';

class Helper {
  void unfocus({required BuildContext context}) {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  String decimeterToCentimeter({required int value}) {
    return ((value * 0.1) * 100).toStringAsFixed(0);
  }

  String hectogramsToKg({required int value}) {
    return (value / 10).toString();
  }
}
