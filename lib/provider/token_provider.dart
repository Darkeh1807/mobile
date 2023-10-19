import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String authToken = '';

  String get getToken => authToken;

  set setToken(String token){
    authToken = token;
    notifyListeners();
  }
}
