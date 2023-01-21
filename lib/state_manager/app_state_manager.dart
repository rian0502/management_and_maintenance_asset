import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;
  late final SharedPreferences _prefs;
  AppStateManager(this._prefs);

  bool get loggedIn => _loggedIn;

  void login(String email, String password, BuildContext context) async {
    APIService.login(email, password)
        .then((value) => {
              if (value != '')
                {
                  _loggedIn = true,
                  _prefs.setString('token', value),
                  _prefs.setBool('login', true),
                  context.go('/'),
                }
            })
        .catchError((error) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login Gagal"),
                ),
              )
            });
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
    print(_prefs.getBool('login'));
    _loggedIn = _prefs.getBool('login') ?? false;
  }
}
