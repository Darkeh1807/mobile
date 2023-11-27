import 'package:bus_booking/models/locations_model.dart';
import 'package:flutter/material.dart';

class DestinationProvider extends ChangeNotifier {
  Place destinationModel = Place();

  Place get getDestination {
    return destinationModel;
  }

  set setDestionation(Place place) {
    destinationModel = place;
    notifyListeners();
  }
}
