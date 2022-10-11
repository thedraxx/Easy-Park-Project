import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/home.dart';

import '../colors/color.dart';

import 'package:flutter/material.dart';

Future<void> displayBottomSheet(BuildContext context, token) async {
  showModalBottomSheet(
      useRootNavigator: true,
      isDismissible: true,
      elevation: 20.0,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('TOKEN',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: azul)),
                //
                Text(token,
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: azul)),
                const SizedBox(height: 10.0),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: MaterialButton(
                    minWidth: 100.0,
                    height: 50.0,
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Reserva'),
                          content: const Text('¿Desea cancelar reserva?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancelar'),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await PeticionesHttp().CancelarReserva(token);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    color: naranja,
                    child:
                        Text('Cancelar Reserva', style: TextStyle(color: azul)),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
