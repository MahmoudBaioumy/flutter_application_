import 'package:flutter/material.dart';

showErrorDialog(context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(error),
  ));
}
