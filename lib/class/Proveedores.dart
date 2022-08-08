import 'dart:convert';

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

  /* @override
  // TODO: implement props
  List<Object?> get props =>
      [id, longitud, latitud, direccion, nombre, cantidad, imagen];

  @override
  // TODO: implement stringify
  bool? get stringify => true;*/
}
