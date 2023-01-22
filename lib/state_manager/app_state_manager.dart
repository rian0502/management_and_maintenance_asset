import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;
  bool _loadingLogin = false;
  late final SharedPreferences _prefs;
  AppStateManager(this._prefs);

  bool get loadingLogin => _loadingLogin;
  bool get loggedIn => _loggedIn;
  void set loadingLogin(bool value) {
    _loadingLogin = value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    _loadingLogin = true;
    notifyListeners();

    APIService.login(email, password)
        .then((value) => {
              if (value != '')
                {
                  _loggedIn = true,
                  _prefs.setString('token', value),
                  _prefs.setBool('login', true),
                  loadingLogin = false,
                  notifyListeners(),
                  context.go('/'),
                }
            })
        .catchError((error) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Email dan Password Tidak Cocok"),
                ),
              ),
              loadingLogin = false,
              notifyListeners(),
            });
  }

  void loadingAction(bool value) {
    _loadingLogin = value;
    notifyListeners();
  }

  void logout() async {
    _loggedIn = false;
    _prefs.remove('token');
    _prefs.setBool('login', false);
    await initializeApp();
    notifyListeners();
  }

  Future<void> initializeApp() async {
    _loggedIn = _prefs.getBool('login') ?? false;
  }
}
