import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String _authToken = '';

  String get getToken => _authToken;

  set setToken(String token) {
    _authToken = token;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
