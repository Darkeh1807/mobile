import 'package:bus_booking/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _userModel = User();

  User get getUser {
    return _userModel;
  }

  set setUser(User user) {
    // ignore: unnecessary_null_comparison
    if (user != null) {
      _userModel = user;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
