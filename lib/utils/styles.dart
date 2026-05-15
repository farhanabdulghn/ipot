import 'package:flutter/material.dart';

class Styles {
  static List<BoxShadow> get containerShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      offset: Offset(0, -1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      offset: Offset(0, -3),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.01),
      offset: Offset(0, -7),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.005),
      offset: Offset(0, -12),
      blurRadius: 5,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.005),
      offset: Offset(0, -19),
      blurRadius: 5,
      spreadRadius: 0,
    ),
  ];
}
