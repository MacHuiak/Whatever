import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExtension on BuildContext {
  // double get height => MediaQuery.of(this).size.height;
  //
  // double get width => MediaQuery.of(this).size.width;

  bool get isBigScreen => width > 400 && height > 900;
}
