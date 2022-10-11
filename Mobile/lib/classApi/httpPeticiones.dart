import 'package:easy_park/class/Proveedores.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
  Future<bool> ConsultaLogin(String mail, String pass, Function _User) async {
    bool validador = false;
    try {
      var url = Uri.parse(
          "https://tonnish-swivel.000webhostapp.com/login/newLogin.php");
      final response = await http.post(url, body: {
        'mail': mail,
        'pass': pass,
        'tipo': "c"
      }).timeout(const Duration(seconds: 90));

      //var data = await json.decode(json.encode(response.body));
      var data = await jsonDecode(response.body);
      //EJECUTA FUNCION - GUARDAR ID USUARIO
      _User(data['cod_cliente'].toString());

      if (response.body != '0') {
        validador = true;
      }
    } on TimeoutException catch (e) {
      print("Termino tiempo de consulta $e");
    } on Error catch (e) {
      print("ERROR EN HTTP $e");
    }
    return validador;
  }

//ENVIA DATOS DE UN NUEVO USUARIO A BACKEND
  Future<dynamic> RegistraDb(String nombre, String mail, String localidad,
      String pass, String tel) async {
    String result = "";
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
      switch (data) {
        case '0':
          result = data;
          break;
        case '1':
          result = data;
          break;
        case 'ERROR':
          result = data;
      }
    } on TimeoutException catch (e) {
      print("Termino tiempo de consulta");
    } on Error catch (e) {
      print("ERROR EN HTTP");
    }
    return result;
  }

//ENVIA DATOS DE NUEVA RESERVA
  Future<String> EnviarReserva(
      cod_cliente, cod_estac, patente, ingreso, salida) async {
    String respuesta = " ";
    try {
      var url = Uri.parse(
          "https://tonnish-swivel.000webhostapp.com/estado_estac/newReserva.php");
      final response = await http.post(url, body: {
        'cod_cliente': cod_cliente,
        'cod_estac': cod_estac,
        'patente': patente,
        'ingreso': ingreso,
        'salida': salida,
      });

      if (response.statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        print(data);
        respuesta = data.toString();
      } else {
        print('ERROR CONEXION');
      }
    } catch (e) {
      print(e);
    }
    return respuesta;
  }

  Future<void> CancelarReserva($token) async {
    String respuesta = " ";
    try {
      var url = Uri.parse(
          "https://tonnish-swivel.000webhostapp.com/estado_estac/newCancelar.php");
      final response = await http.post(url, body: {
        'token': $token,
      });

      if (response.statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        print(data);
        respuesta = data.toString();
      } else {
        print('ERROR CONEXION');
      }
    } catch (e) {
      print(e);
    }
  }
}
