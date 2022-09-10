import 'dart:async';
import 'dart:convert';

import 'package:easy_park/class/Proveedores.dart';
import 'package:http/http.dart' as http;

class PeticionesHttp {
  //GET DE TODOS LOS LISTAS DE PROVEEDORES
  Future<List<Proveedores>> fetchProveedores() async {
    final response = await http.get(Uri.parse(
        'https://tonnish-swivel.000webhostapp.com/estacionamientos/apiEstac.php'));
    if (response.statusCode == 200) {
      return proveedoresFromJson(response.body);
    } else {
      throw Exception('Error en carga de perticion');
    }
  }

//CONSULTA LOGIN USUARIO
//CONSULTAR SI USUARIO ES VALIDO EN BASE DE DATOS
  Future<bool> ConsultaLogin(String mail, String pass) async {
    bool validador = false;
    try {
      var url = Uri.parse(
          "https://tonnish-swivel.000webhostapp.com/login/newLogin.php");
      final response = await http.post(url, body: {
        'mail': mail,
        'pass': pass,
        'tipo': "c"
      }).timeout(const Duration(seconds: 90));

      var data = await json.decode(json.encode(response.body));
      print(data);
      if (response.body != '0') {
        validador = true;
      }
    } on TimeoutException catch (e) {
      print("Termino tiempo de consulta");
    } on Error catch (e) {
      print("ERROR EN HTTP");
    }
    return validador;
  }

  Future<dynamic> RegistraDb(String nombre, String mail, String localidad,
      String pass, String tel) async {
    print("EL REGISTRO ES $nombre / $mail  / $tel  /$localidad");
    try {
      var url = Uri.parse(
          "https://tonnish-swivel.000webhostapp.com/login/newRegistro.php");
      final response = await http.post(url, body: {
        'nombre': nombre,
        'mail': mail,
        'localidad': localidad,
        'pass': pass,
        'tel': tel,
        'tipo': "c"
      }).timeout(const Duration(seconds: 90));

      var data = await json.decode(json.encode(response.body));
      print(data);
    } on TimeoutException catch (e) {
      print("Termino tiempo de consulta");
    } on Error catch (e) {
      print("ERROR EN HTTP");
    }
  }
}
