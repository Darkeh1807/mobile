import 'package:flutter/material.dart';

import '../models/trip_model.dart';

class TripProvider extends ChangeNotifier {
  Trip _trip = Trip();

  Trip get trip => _trip;

  set setTrip(Trip trip) {
    _trip = trip;
    notifyListeners();
  }

  void clearTrip() {
    _trip = Trip();
    notifyListeners();
  }
}
