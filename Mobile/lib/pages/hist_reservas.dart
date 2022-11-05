import 'package:easy_park/class/all_Reservas.dart';
import 'package:easy_park/class/users.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/formatoDatetime.dart';
import 'package:easy_park/helpers/verif_estado.dart';
import 'package:easy_park/pages/cuenta.dart';
import 'package:easy_park/widgets/verToken.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistorialRes extends StatefulWidget {
  const HistorialRes({
    super.key,
  });

  @override
  State<HistorialRes> createState() => _Page3State();
}

class _Page3State extends State<HistorialRes> {
  late Future<List<Reservas>> futureReservas;

  late var ProviderUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser = Provider.of<User>(context);
    Widget element = Container();

    return Scaffold(
        appBar: AppBar(

            //automaticallyImplyLeading: false,
            title: Text(
              'Reservas',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: claro,
              ),
            ),
            elevation: 0,
            backgroundColor: azuloscuro),
        body: FutureBuilder(
            key: const Key('futureBuilder'),
            future: PeticionesHttp().fetchReservas(ProviderUser.getId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError && snapshot.data == null) {
                return Center(
                    child: Text(
                  "Sin reservas",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: azuloscuro,
                  ),
                ));
              } else if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                      backgroundColor: azulmedio, color: azulClaro),
                );
              } else {
                element = ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data[index];
                      String fecha = Formato(data.ingreso);
                      String direccion = data.direccion;
                      String estadoRes = VerificaEstado(
                          data.entrada, data.salida, data.cancelacion);

                      print(data.ingreso.toString());

                      bool reserva =
                          estadoReser(data.entrada, data.cancelacion);

                      return Card(
                        child: ListTile(
                            trailing: const Icon(Icons.drive_eta_sharp),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                direccion,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: azuloscuro,
                                ),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    fecha,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      color: azuloscuro,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      estadoRes,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        color: azuloscuro,
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      onPressed: () {
                                        displayBottomSheet(
                                          context,
                                          data.token.toString(),
                                          data.direccion,
                                          fecha,
                                          reserva,
                                        );
                                      },
                                      child: Text(
                                        'ver',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          color: naranja,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      );
                    });

                return element;
              }
            }));
  }

  //**** ACTUALIZA PETICION HTTP  ***//
  Future<void> _actualizar() async {
    setState(() {});
  }
}
