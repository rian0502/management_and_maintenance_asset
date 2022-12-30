
import 'package:flutter/cupertino.dart';

class SimasTab{
  static const int assets = 0;
  static const int maintenance = 1;
  static const int setting = 2;
}

class AppStateManager extends ChangeNotifier{
  bool _loggedIn = false;

  int _selectedTab = SimasTab.assets;

  bool get isLoggedIn => _loggedIn;
  int get getSelectedTab => _selectedTab;

  Future<void> initializeApp() async {
    _loggedIn = true;
  }

  void login(String nrp, String password) async {
    _loggedIn = true;
    notifyListeners();
  }
  void logout() async {
    _loggedIn = false;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }
}