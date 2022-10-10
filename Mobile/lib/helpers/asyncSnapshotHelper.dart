import 'dart:convert';

import 'package:easy_park/class/userlocation.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/ordenaLista.dart';
import 'package:easy_park/widgets/card_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget asyncSnapshotHelper(AsyncSnapshot snapshot, userLocation, context) {
  Widget element = Container();
  if (snapshot.hasError) {
  } else if (!snapshot.hasData) {
    element = Center(
      child:
          CircularProgressIndicator(backgroundColor: azulclaro, color: claro),
    );
  } else {
    //*********VERIFICA ESTACIONACIONAMIENTO MAS PROXIMO************//
    var list =
        OrdenaLista(snapshot, userLocation.latitude, userLocation.longitude);

//*****************************************************************//
    return element = ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final data = list[index];
          String nombre = data['nombre'];
          String direccion = data['direccion'];
          int id = data['id'];
          String horario = data['horario'];
          double lat = data['lat'];
          double long = data['long'];
          double distancia = data['distancia'];
          int cantidad = data['cantidad'];
          String imagen = data['imagen'];
          int precio = data['precio'];
          return Card_Prov(
              nombre: nombre,
              direccion: direccion,
              cantidad: cantidad,
              id: id,
              latitud: lat,
              longitud: long,
              distancia: distancia,
              horario: horario,
              imagen: imagen,
              precio: precio);
        });

    /*ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final data = snapshot.data![index];
          String nombre = data.nombre;
          String direccion = data.direccion;
          int id = data.cod_estac;
          double lat = data.latitud;
          String horario = data.horario;
          double long = data.longitud;
          double distancia = calculateDistance(
              userLocation.latitude, userLocation.longitude, lat, long);
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
              distancia: distancia,
              horario: horario,
              imagen: imagen,
              precio: precio);
        });*/
  }
  return element;
}
