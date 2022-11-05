import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/helpers/formatoDatetime.dart';
import 'package:easy_park/home.dart';
import 'package:easy_park/pages/hist_reservas.dart';
import 'package:easy_park/pages/hist_reservas.dart';

import '../colors/color.dart';

import 'package:flutter/material.dart';

Future<void> displayBottomSheet(
  BuildContext context,
  String token,
  String direccion,
  String horaIngreso,
  bool estado,
) async {
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
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('TOKEN',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: azuloscuro)),
                //
                Text(token,
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: azuloscuro)),
                const SizedBox(height: 10.0),
                Text(direccion,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: azuloscuro)),
                Text("Fecha: $horaIngreso",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: azuloscuro)),

                estado != true
                    ? const SizedBox(height: 10.0)
                    : ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        child: MaterialButton(
                          minWidth: 100.0,
                          height: 50.0,
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                backgroundColor: claro,
                                title: Text('Reserva',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: azuloscuro)),
                                content: Text('¿Desea cancelar reserva?',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: azuloscuro)),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancelar'),
                                    child: Text('Cancelar',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w300,
                                            color: azuloscuro)),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Navigator.pop(context, 'ok');
                                      await PeticionesHttp()
                                          .CancelarReserva(token);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    child: Text('OK',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w300,
                                            color: azuloscuro)),
                                  ),
                                ],
                              ),
                            );
                          },
                          color: naranja,
                          child: Text('Cancelar Reserva',
                              style: TextStyle(color: azuloscuro)),
                        ),
                      ),
              ],
            ),
          ),
        );
      });
}
