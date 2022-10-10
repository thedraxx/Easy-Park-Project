import 'package:easy_park/class/userlocation.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/calculaCosto.dart';
import 'package:easy_park/helpers/dateTime_format.dart';
import 'package:easy_park/helpers/validacion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class PageReserva extends StatefulWidget {
  const PageReserva({
    super.key,
    required this.id_estac,
    required this.nombre,
    required this.precio,
  });

  final String id_estac;
  final String nombre;
  final double precio;

  @override
  State<PageReserva> createState() => _PageReservaState();
}

class _PageReservaState extends State<PageReserva> {
  final _reservakey = GlobalKey<FormState>();
  final IngresoController = TextEditingController();
  final SalidaController = TextEditingController();
  final PatenteController = TextEditingController();
  String _fechaIngreso = "";
  String _fechaSalida = "";
  String Ingreso = " ";
  String Salida = " ";
  String _patente = "";
  late var ProviderUser;
  double total = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser = Provider.of<UserLocation>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_rounded, color: azul)),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: Text("Reserva ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: azul,
                        fontSize: 23.0,
                        fontFamily: 'Montserrat',
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 30.0, bottom: 30.0),
                  child: Text("${widget.nombre}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: azul,
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

  //WIDGET DE RESERVA
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
                                color: azulclaro,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w100,
                              ),
                              labelStyle: TextStyle(color: azul),
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
                                color: azulclaro,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w100,
                              ),
                              labelStyle: TextStyle(color: azul),
                              suffixIcon: IconButton(
                                  splashRadius: 20,
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.watch_later_outlined))),
                          //onSaved: (newValue) => _usuario = newValue!,
                        )),
                    onTap: () async {
                      _Calendario("s");
                    },
                  ),
                  SizedBox(height: 15),
                  Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: claro,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: PatenteController,
                        textCapitalization: TextCapitalization.characters,

                        validator: (value) => ValidaPatente(value!),
                        //keyboardType: TextInputType.emailAddress,
                        cursorColor: claro,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 14, right: 15),
                            hintText: 'Numero de patente',
                            hintStyle: TextStyle(
                              color: azulclaro,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w100,
                            ),
                            labelStyle: TextStyle(color: azul),
                            suffixIcon: IconButton(
                                splashRadius: 20,
                                onPressed: () {},
                                icon: const Icon(Icons.drive_eta_sharp))),
                        // onSaved: (newValue) => _patente = newValue!,
                      )),
                  SizedBox(height: 30.0),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total de estadia: ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: azulclaro,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "\$ $total",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: azulclaro,
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

                          //CREAR RESERVA
                          var token = await PeticionesHttp().EnviarReserva(
                              ProviderUser.Userid.toString(),
                              widget.id_estac,
                              PatenteController.text,
                              Ingreso,
                              Salida);

                          if (token != "0") _AlertReserva(token);
                        } else {
                          print("faltan datos");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: naranja,
                            elevation: 10.0,
                            content: Text(
                              'Datos incompletos',
                              style: TextStyle(color: azul),
                            ),
                            duration: const Duration(seconds: 1),
                          ));
                        }
                      },
                      color: azul,
                      child: Text('Confirmar', style: TextStyle(color: claro)),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  void _Calendario(tipo) {
    print(IngresoController.text);

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

  Future<dynamic> _AlertReserva(token) {
    final Element = showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const Text("Token"),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  token,
                  style: TextStyle(
                    color: azul,
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Ingreso: ${Ingreso}hs",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      )),
                  Text("Salida: ${Salida}hs",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      )),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancelar reserva",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return Element;
  }
}
