import 'package:easy_park/colors/color.dart';
import 'package:easy_park/widgets/card_prov.dart';

import 'package:flutter/material.dart';

Widget asyncSnapshotHelper(AsyncSnapshot snapshot) {
  Widget element = Container();
  if (snapshot.hasError) {
  } else if (!snapshot.hasData) {
    element = Center(
      child: CircularProgressIndicator(color: claro),
    );
  } else {
    return element = ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final data = snapshot.data![index];
          String nombre = data.nombre;
          String direccion = data.direccion;
          int id = data.cod_estac;
          double lat = data.latitud;
          String horario = data.horario;
          double long = data.longitud;
          int cantidad = data.cantidad;
          String imagen = data.imagen;
          int precio = data.precio;
          return Card_Prov(
              nombre: nombre,
              direccion: direccion,
              cantidad: cantidad,
              id: id,
              latitud: lat,
              longitud: long,
              horario: horario,
              imagen: imagen,
              precio: precio);
        });
  }
  return element;
}
