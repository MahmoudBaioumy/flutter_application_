import 'package:flutter/material.dart';

pushwithReplacement(context, Widget Newpage) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => Newpage,
  ));
}

push(context, Widget Newpage) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Newpage,
  ));
}
