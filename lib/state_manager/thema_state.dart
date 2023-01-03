import 'package:flutter/cupertino.dart';

class ThemaState extends ChangeNotifier{
  bool _darkmode = false;

  bool get darkmode => _darkmode;

  void darkMode(bool darkMode) {
    _darkmode = darkMode;
    notifyListeners();
  }
}