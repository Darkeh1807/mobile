import 'package:bus_booking/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User userModel = User();

  User get getUser {
    return userModel;
  }

  set setUser(User user) {
    userModel = user;
    notifyListeners();
  }
}
