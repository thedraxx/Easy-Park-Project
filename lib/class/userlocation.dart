import 'package:flutter/material.dart';

//CLASS DE LOCALIZACION PROVIDER
class UserLocation with ChangeNotifier {
  double _latitude = -32.9636381489;
  double _longitude = -60.6324221025;

  get lat => _latitude;

  get long => _longitude;

  set latitud(double latitud) {
    _latitude = latitud;
    notifyListeners();
  }

  set longitud(double longitud) {
    _longitude = longitud;

    notifyListeners();
  }
}
