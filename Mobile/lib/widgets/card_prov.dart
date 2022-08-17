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
      required this.cantidad,
      required this.imagen});

  final String nombre;
  final String direccion;
  final int id;
  final double latitud;
  final double longitud;
  final int cantidad;
  final String imagen;

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
                  cantidad: widget.cantidad,
                  imagen: widget.imagen,
                )));
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
                    image: NetworkImage(
                        "${widget.imagen}"), //AssetImage('assets/Parking.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: azulclaro,
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Colors.red,
              ),
              /*  SizedBox(
                width: 10,
              ),*/
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
                      height: 15,
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Plazas disponibles: ${widget.cantidad}",
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






/*
class Card_Prov extends StatelessWidget {
  const Card_Prov({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
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
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/Parking.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: azulclaro,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
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
                          "Rosario Parking",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 78, 76, 76),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "San Luis 1050 Rosario",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Montserrat',
                            //fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 78, 76, 76),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Plazas disponibles: 5",
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
                    // color: Colors.black12,
                    margin: const EdgeInsets.all(10.0),
                    child: Text(
                      "2 Kms",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 30,
      ),
    );
  }
}*/
