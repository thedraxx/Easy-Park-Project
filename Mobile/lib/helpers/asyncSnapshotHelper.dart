import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/ordenaLista.dart';
import 'package:easy_park/widgets/card_prov.dart';
import 'package:flutter/material.dart';

Widget asyncSnapshotHelper(AsyncSnapshot snapshot, userLocation, context) {
  Widget element = Container();

  if (!snapshot.hasData) {
    element = Center(
      child: CircularProgressIndicator(
          backgroundColor: azulmedio, color: azulClaro),
    );
  } else {
    //*********VERIFICA ESTACIONACIONAMIENTO MAS PROXIMO************//
    var list =
        OrdenaLista(snapshot, userLocation.latitude, userLocation.longitude);

//*****************************************************************//

    if (snapshot.data.length > 0) {
      element = ListView.builder(
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
            int cant_actual = data['cant_actual'];

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
              precio: precio,
              cant_actual: cant_actual,
            );
          });
    } else {
      element = Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No se encuentran estacionamientos",
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: azuloscuro,
            ),
          ),
        ],
      ));
    }
  }
  // }
  return element;
}
