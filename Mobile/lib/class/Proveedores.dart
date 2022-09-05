/*import 'dart:convert';

List<Proveedores> proveedoresFromJson(String str) => List<Proveedores>.from(
    json.decode(str).map((x) => Proveedores.fromJson(x)));

String proveedoresToJson(List<Proveedores> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Proveedores {
  Proveedores({
    required this.id,
    required this.longitud,
    required this.latitud,
    required this.direccion,
    required this.nombre,
    required this.cantidad,
    required this.imagen,
  });

  final int id;
  final double longitud;
  final double latitud;
  final String direccion;
  final String nombre;
  final int cantidad;
  final String imagen;

  factory Proveedores.fromJson(Map<String, dynamic> json) => Proveedores(
      id: json["id"],
      longitud: json["longitud"].toDouble(),
      latitud: json["latitud"].toDouble(),
      direccion: json["direccion"],
      nombre: json["nombre"],
      cantidad: json["cantidad"],
      imagen: json["imagen"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "longitud": longitud,
        "latitud": latitud,
        "direccion": direccion,
        "nombre": nombre,
        "cantidad": cantidad,
        "imagen": imagen
      };


}
*/
import 'dart:convert';

List<Proveedores> proveedoresFromJson(String str) => List<Proveedores>.from(
    json.decode(str).map((x) => Proveedores.fromJson(x)));

String proveedoresToJson(List<Proveedores> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Proveedores {
  Proveedores({
    required this.cod_estac,
    required this.cod_prov,
    required this.direccion,
    required this.latitud,
    required this.longitud,
    required this.horario,
    required this.nombre,
    required this.cantidad,
    required this.imagen,
  });

  final int cod_estac;
  final int cod_prov;
  final String direccion;
  final double latitud;
  final double longitud;
  final String horario;
  final String nombre;
  final int cantidad;
  final String imagen;

  factory Proveedores.fromJson(Map<String, dynamic> json) => Proveedores(
        cod_estac: json["cod_estac"],
        cod_prov: json["cod_prov"],
        direccion: json["direccion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        horario: json["horario"],
        nombre: json["nombre"],
        cantidad: json["cantidad"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "cod_estac": cod_estac,
        "cod_prov": cod_prov,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "horario": horario,
        "nombre": nombre,
        "cantidad": cantidad,
        "imagen": imagen,
      };
}
