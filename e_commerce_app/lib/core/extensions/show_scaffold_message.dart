import 'package:flutter/material.dart';

extension ShowMessage on BuildContext {
  showScaffoldMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}
