import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

//CLASS DE LOCALIZACION PROVIDER
class UserLocation with ChangeNotifier {
  LatLng _Position = LatLng(-32.9636381489, -60.6324221025);
  int _idUser = 0;

//OBTENER POSICION Y NOTIFICAR
  get UserPosition => _Position;
  //OBTENER ID DE USUARIO
  get Userid => _idUser;

//MODIFICAR POSICION Y NOTIFICAR
  set position(LatLng position) {
    _Position = position;
    notifyListeners();
  }

  set idUsuario(int id) {
    _idUser = id;
    notifyListeners();
  }
}
