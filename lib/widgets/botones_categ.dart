import 'package:easy_park/colors/color.dart';
import 'package:flutter/material.dart';

//BOTONES DE CATEGORIA-PANTALLA DE INICIO
class Boton_cat extends StatelessWidget {
  const Boton_cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        /* Container(
            width: 400,
            margin: const EdgeInsets.all(20.0),
            child: const Text(
              "Tipos de vehiculos",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            )),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azul.withOpacity(0.5),
              highlightColor: azul.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.car_repair_rounded, color: azul, size: 28),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azul.withOpacity(0.5),
              highlightColor: azul.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.fire_truck, color: azul, size: 28),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azul.withOpacity(0.5),
              highlightColor: azul.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.motorcycle, color: azul, size: 28),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azul.withOpacity(0.5),
              highlightColor: azul.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.pedal_bike, color: azul, size: 28),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
