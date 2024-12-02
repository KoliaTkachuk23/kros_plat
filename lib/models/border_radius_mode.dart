import 'package:flutter/material.dart';

class BorderRadiusModel with ChangeNotifier {
  double topLeft = 20.0;
  double topRight = 20.0;
  double bottomLeft = 20.0;
  double bottomRight = 20.0;

  void updateTopLeft(double value) {
    topLeft = value;
    notifyListeners();
  }

  void updateTopRight(double value) {
    topRight = value;
    notifyListeners();
  }

  void updateBottomLeft(double value) {
    bottomLeft = value;
    notifyListeners();
  }

  void updateBottomRight(double value) {
    bottomRight = value;
    notifyListeners();
  }
}