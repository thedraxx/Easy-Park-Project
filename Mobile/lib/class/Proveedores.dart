import 'dart:convert';

List<Proveedores> proveedoresFromJson(String str) => List<Proveedores>.from(
    json.decode(str).map((x) => Proveedores.fromJson(x)));

String proveedoresToJson(List<Proveedores> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Proveedores {
  Proveedores(
      {required this.cod_estac,
      required this.cod_proveedor,
      required this.direccion,
      required this.latitud,
      required this.longitud,
      required this.horario,
      required this.nombre,
      required this.cantidad,
      required this.imagen,
      required this.precio});

  final int cod_estac;
  final int cod_proveedor;
  final String direccion;
  final double latitud;
  final double longitud;
  final String horario;
  final String nombre;
  final int cantidad;
  final String imagen;
  final int precio;

  factory Proveedores.fromJson(Map<String, dynamic> json) => Proveedores(
      cod_estac: json["cod_estac"],
      cod_proveedor: json["cod_proveedor"],
      direccion: json["direccion"],
      latitud: json["latitud"],
      longitud: json["longitud"],
      horario: json["horario"],
      nombre: json["nombre"],
      cantidad: json["cantidad"],
      imagen: json["imagen"],
      precio: json["precio"]);

  Map<String, dynamic> toJson() => {
        "cod_estac": cod_estac,
        "cod_proveedor": cod_proveedor,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "horario": horario,
        "nombre": nombre,
        "cantidad": cantidad,
        "imagen": imagen,
        "precio": precio
      };
}
