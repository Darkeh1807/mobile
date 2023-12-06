import 'package:bus_booking/models/locations_model.dart';
import 'package:flutter/material.dart';

class OriginProvider extends ChangeNotifier {
  Place originModel = Place();

  Place get getOrigin {
    return originModel;
  }

  set setOrigin(Place place) {
    originModel = place;
    notifyListeners();
  }

  void clearOrigin() {
    originModel = Place();
    notifyListeners();
  }
}
