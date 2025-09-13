 import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext{
  double get getWidth => MediaQuery.sizeOf(this).width;
  double get getHeight => MediaQuery.sizeOf(this).height;
}

