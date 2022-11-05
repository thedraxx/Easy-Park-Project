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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azuloscuro.withOpacity(0.5),
              highlightColor: azuloscuro.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child:
                    Icon(Icons.car_repair_rounded, color: azuloscuro, size: 28),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azuloscuro.withOpacity(0.5),
              highlightColor: azuloscuro.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.fire_truck, color: azuloscuro, size: 28),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azuloscuro.withOpacity(0.5),
              highlightColor: azuloscuro.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.motorcycle, color: azuloscuro, size: 28),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: azuloscuro.withOpacity(0.5),
              highlightColor: azuloscuro.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: claro),
                child: Icon(Icons.pedal_bike, color: azuloscuro, size: 28),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
