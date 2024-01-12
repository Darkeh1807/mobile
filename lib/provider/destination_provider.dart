import 'package:bus_booking/models/locations_model.dart';
import 'package:flutter/material.dart';

class DestinationProvider extends ChangeNotifier {
  Place _destinationModel = Place();

  Place get getDestination {
    return _destinationModel;
  }

  set setDestionation(Place place) {
    _destinationModel = place;
    notifyListeners();
  }

  void clearDestination(){
    _destinationModel = Place();
    notifyListeners();
  }
}
