import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

//CLASS DE LOCALIZACION PROVIDER
class UserLocation with ChangeNotifier {
  LatLng _Position = LatLng(-32.9636381489, -60.6324221025);

//OBTENER POSICION Y NOTIFICAR
  get UserPosition => _Position;

//MODIFICAR POSICION Y NOTIFICAR
  set position(LatLng position) {
    _Position = position;
    notifyListeners();
  }
}
