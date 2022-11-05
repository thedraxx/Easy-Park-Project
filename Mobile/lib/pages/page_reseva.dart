import 'dart:ffi';

import 'package:easy_park/class/users.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/calculaCosto.dart';
import 'package:easy_park/helpers/formatoDatetime.dart';
import 'package:easy_park/helpers/validacion.dart';
import 'package:easy_park/home.dart';
import 'package:easy_park/widgets/verToken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class PageReserva extends StatefulWidget {
  const PageReserva({
    super.key,
    required this.id_estac,
    required this.nombre,
    required this.direccion,
    required this.precio,
  });

  final String id_estac;
  final String nombre;
  final String direccion;
  final double precio;

  @override
  State<PageReserva> createState() => _PageReservaState();
}

class _PageReservaState extends State<PageReserva> {
  final _reservakey = GlobalKey<FormState>();
  final IngresoController = TextEditingController();
  final SalidaController = TextEditingController();
  final PatenteController = TextEditingController();
  String Ingreso = " ";
  String Salida = " ";
  late var ProviderUser;
  double total = 0;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser = Provider.of<User>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_rounded, color: azuloscuro)),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 30.0),
                  child: Text("Reserva ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: azuloscuro,
                        fontSize: 23.0,
                        fontFamily: 'Montserrat',
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 30.0, bottom: 30.0),
                  child: Text("${widget.nombre}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: azuloscuro,
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      )),
                ),
              ],
            ),
            _FormReserba(context),
          ],
        ));
  }

  //***********WIDGET DE RESERVA**************//
  _FormReserba(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Form(
              key: _reservakey,
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: claro,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: azulmedio),
                        ),
                        child: TextFormField(
                          enabled: false,
                          controller: IngresoController,
                          validator: (value) => ValidaPatente(value!),
                          cursorColor: claro,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 14, right: 15),
                              hintText: 'Hora de ingreso',
                              hintStyle: TextStyle(
                                color: azuloscuro,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                              ),
                              labelStyle: TextStyle(color: azuloscuro),
                              suffixIcon: IconButton(
                                  splashRadius: 20,
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.watch_later_outlined))),
                          // onSaved: (newValue) => _ = newValue!,
                        )),
                    onTap: () {
                      _Calendario("i");
                    },
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: claro,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: azulmedio),
                        ),
                        child: TextFormField(
                          enabled: false,
                          controller: SalidaController,
                          validator: (value) => ValidaPatente(value!),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: claro,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 14, right: 15),
                              hintText: 'Hora de salida',
                              hintStyle: TextStyle(
                                color: azuloscuro,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                              ),
                              labelStyle: TextStyle(color: azuloscuro),
                              suffixIcon: IconButton(
                                  splashRadius: 20,
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.watch_later_outlined))),
                        )),
                    onTap: () async {
                      _Calendario("s");
                    },
                  ),
                  const SizedBox(height: 15),
                  Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: claro,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: azulmedio),
                      ),
                      child: TextFormField(
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        controller: PatenteController,
                        textCapitalization: TextCapitalization.characters,
                        validator: (value) => ValidaPatente(value!),
                        cursorColor: claro,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 14, right: 15),
                            hintText: 'Numero de patente',
                            hintStyle: TextStyle(
                              color: azuloscuro,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                            ),
                            labelStyle: TextStyle(color: azuloscuro),
                            suffixIcon: IconButton(
                                splashRadius: 20,
                                onPressed: () {},
                                icon: const Icon(Icons.drive_eta_sharp))),
                      )),
                  const SizedBox(height: 30.0),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total de estadia: ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: azuloscuro,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "\$ $total",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: azuloscuro,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: MaterialButton(
                      minWidth: 300.0,
                      height: 50.0,
                      onPressed: () async {
                        final form = _reservakey.currentState;
                        if (form!.validate()) {
                          form.save();

                          //**************CREAR RESERVA*********************/
                          var token = await PeticionesHttp().EnviarReserva(
                              ProviderUser.getId.toString(),
                              widget.id_estac,
                              PatenteController.text,
                              Ingreso,
                              Salida);

                          if (token != "0") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));

                            displayBottomSheet(context, token, widget.direccion,
                                Formato(DateTime.parse(Ingreso)), true);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: naranja,
                            elevation: 10.0,
                            content: Text(
                              'Datos incompletos',
                              style: TextStyle(color: azuloscuro),
                            ),
                            duration: const Duration(seconds: 1),
                          ));
                        }
                      },
                      color: azuloscuro,
                      child: Text('Confirmar', style: TextStyle(color: claro)),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Future<void> _actualizar() async {
    setState(() {});

    // return Future.delayed(duracion);
  }

//************* SELECCION DE HORA ******************/
  void _Calendario(tipo) {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: IngresoController.text.isNotEmpty
            ? DateTime.parse(IngresoController.text)
            : DateTime.now(),
        maxTime: SalidaController.text.isNotEmpty
            ? DateTime.parse(SalidaController.text)
            : DateTime.now().add(const Duration(days: 1)), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      setState(() {
        if (tipo == "i") {
          Ingreso = date.toString();
          IngresoController.text = "${date.toString()}";
          Salida = " ";
          SalidaController.clear();
          total = 0;
        } else {
          Salida = date.toString();
          SalidaController.text = "${date.toString()}";
        }
        if (Ingreso != " " && Salida != " ") {
          total = double.parse(Costo(Ingreso, Salida, widget.precio));
        }
      });
    },
        currentTime: IngresoController.text.isNotEmpty
            ? DateTime.parse(IngresoController.text)
            : DateTime.now(),
        locale: LocaleType.es);
  }
}
