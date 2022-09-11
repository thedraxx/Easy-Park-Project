import 'package:easy_park/colors/color.dart';
import 'package:easy_park/pages/view.dart';
import 'package:flutter/material.dart';

class Card_Prov extends StatefulWidget {
  const Card_Prov(
      {super.key,
      required this.nombre,
      required this.direccion,
      required this.id,
      required this.latitud,
      required this.longitud,
      required this.horario,
      required this.cantidad,
      required this.imagen,
      required this.precio});

  final String nombre;
  final String direccion;
  final int id;
  final double latitud;
  final double longitud;
  final String horario;
  final int cantidad;
  final String imagen;
  final int precio;

  @override
  State<Card_Prov> createState() => _Card_ProvState();
}

class _Card_ProvState extends State<Card_Prov> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Seccion(
                id: widget.id,
                nombre: widget.nombre,
                direccion: widget.direccion,
                latitud: widget.latitud,
                longitud: widget.longitud,
                horario: widget.horario,
                cantidad: widget.cantidad,
                imagen: widget.imagen,
                precio: widget.precio)));
      },
      child: Container(
        height: 120,
        width: 700,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(//
                        "${widget.imagen}"), //AssetImage('assets/Parking.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: azulclaro,
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Colors.red,
              ),
              Container(
                height: 120,
                width: 150,
                //color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.nombre}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 76, 76),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${widget.direccion}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        //fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 76, 76),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\$${widget.precio} por hora",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        //fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 76, 76),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "2 Kms",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
