import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterState extends ChangeNotifier {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController get name => _name;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;

  bool _loading = false;
  bool get loading => _loading;

  void set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void set name(TextEditingController value) {
    _name = value;
    notifyListeners();
  }

  void set email(TextEditingController value) {
    _email = value;
    notifyListeners();
  }

  void set password(TextEditingController value) {
    _password = value;
    notifyListeners();
  }

  void set confirmPassword(TextEditingController value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void register(BuildContext context) {
    _loading = !_loading;
    notifyListeners();
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data Harus di isi dengan lengkap"),
        ),
      );
    } else if (password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Tidak Cocok"),
        ),
      );
    } else {
      print("Berhasil");
    }
    _loading = !_loading;
    notifyListeners();
  }
}
