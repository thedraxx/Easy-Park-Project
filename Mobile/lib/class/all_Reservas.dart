// To parse this JSON data, do
//
//     final reservas = reservasFromJson(jsonString);

import 'dart:convert';

List<Reservas> reservasFromJson(String str) =>
    List<Reservas>.from(json.decode(str).map((x) => Reservas.fromJson(x)));

String reservasToJson(List<Reservas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservas {
  Reservas({
    required this.token,
    required this.codCliente,
    required this.direccion,
    required this.codEstac,
    required this.patente,
    required this.fecha,
    required this.ingreso,
    required this.salida,
    required this.entrada,
    required this.cancelacion,
    required this.fechaIngr,
    required this.fechaSal,
  });

  final dynamic token;
  final int codCliente;
  final String direccion;
  final int codEstac;
  final String patente;
  final DateTime fecha;
  final DateTime ingreso;
  final int salida;
  final int entrada;
  final int cancelacion;
  final DateTime? fechaIngr;
  final DateTime? fechaSal;

  factory Reservas.fromJson(Map<String, dynamic> json) => Reservas(
        token: json["token"],
        codCliente: json["cod_cliente"],
        direccion: json['direccion'],
        codEstac: json["cod_estac"],
        patente: json["patente"],
        fecha: DateTime.parse(json["fecha"]),
        ingreso: DateTime.parse(json["ingreso"]),
        salida: json["salida"],
        entrada: json["entrada"],
        cancelacion: json["cancelacion"],
        fechaIngr: json["fecha_ingr"] == null
            ? null
            : DateTime.parse(json["fecha_ingr"]),
        fechaSal: json["fecha_sal"] == null
            ? null
            : DateTime.parse(json["fecha_sal"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "cod_cliente": codCliente,
        "direccion": direccion,
        "cod_estac": codEstac,
        "patente": patente,
        "fecha": fecha.toIso8601String(),
        "ingreso": ingreso.toIso8601String(),
        "salida": salida,
        "entrada": entrada,
        "cancelacion": cancelacion,
        "fecha_ingr": fechaIngr == null ? null : fechaIngr?.toIso8601String(),
        "fecha_sal": fechaSal == null ? null : fechaSal?.toIso8601String(),
      };
}
