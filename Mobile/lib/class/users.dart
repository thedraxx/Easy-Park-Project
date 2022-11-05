import 'package:flutter/material.dart';

class User with ChangeNotifier {
  late int _id;
  late String _nombre;
  late String _mail;
  late String _localidad;
  late int _telefono;
  late String _fecha;
//GET => DATOS DEL USUARIO
  get getId => _id;
  get getNombre => _nombre;
  get getLocalidad => _localidad;
  get getMail => _mail;
  get getTelefono => _telefono;
  get getFecha => _fecha;
//SET => OBJ DE USUARIO
  set objUsers(dynamic data) {
    _id = data['cod_cliente'];
    _nombre = data['nombre'];
    _localidad = data['localidad'];
    _mail = data['mail'];
    _telefono = data['telefono'];
    _fecha = data['fecha_inscripcion'];
    notifyListeners();
  }
}
