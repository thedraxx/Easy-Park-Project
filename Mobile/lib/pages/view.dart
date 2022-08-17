import 'package:easy_park/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

//DESCRIPCION DE PROVEEDOR SELECCIONADO
class Seccion extends StatefulWidget {
  const Seccion(
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
  State<Seccion> createState() => _Page2State();
}

class _Page2State extends State<Seccion> {
  String _fechaReserva = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: azul,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
              title: Text("${widget.nombre}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  )),
              background: Image.network(
                widget.imagen,
                fit: BoxFit.cover,
              )),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            width: 100,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text("${widget.nombre}",
                        style: TextStyle(
                          color: azul,
                          fontSize: 22.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  subtitle: Text("${widget.direccion} Santa fe - Rosario",
                      style: TextStyle(
                        color: azul,
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      )),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("✓  Abierto de Lunes a sabado de 7hs a 23hs",
                          style: TextStyle(
                            color: azul,
                            fontSize: 16.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          )),
                      Text("✓  Estacionamiento disponibles: ${widget.cantidad}",
                          style: TextStyle(
                            color: azul,
                            fontSize: 16.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          )),
                      Text("✓  Estadia por hora: \$180",
                          style: TextStyle(
                            color: azul,
                            fontSize: 16.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                          print(DateTime.tryParse('$date'));
                          setState(() {
                            _fechaReserva =
                                "${date.day}/${date.month} - ${date.hour} : ${date.minute}  ";
                          });
                          // _fechaReserva = date;
                        }, currentTime: DateTime.now(), locale: LocaleType.es);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Reservar $_fechaReserva',
                            style: TextStyle(color: Colors.orange),
                          ),
                          Icon(
                            Icons.date_range,
                            color: azulclaro,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 30.0),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            height: 200,
            width: 100,
            color: claro,
            child: FlutterMap(
              key: const Key('BuilderMap'),
              //mapController: mapController,
              options: MapOptions(
                minZoom: 5,
                maxZoom: 18,
                center:
                    LatLng(widget.latitud, widget.longitud), // userLocation,
                zoom: 16,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/davidfi/cl4mxpt41001c14qlkbnmsgkw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGF2aWRmaSIsImEiOiJja2R3ZWt2bzAxcXpqMnRueTBqb2hndHc4In0.AJ933P-vw0YG6U0N4woASA',
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoiZGF2aWRmaSIsImEiOiJja2R3ZWt2bzAxcXpqMnRueTBqb2hndHc4In0.AJ933P-vw0YG6U0N4woASA',
                      'id': 'mapbox.mapbox-streets-v8',
                    }),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(widget.latitud, widget.longitud),
                      builder: (ctx) => GestureDetector(
                        onLongPress: () {},
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.orange,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: () {},
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        backgroundColor: azul,
        label: const Text('Reservar'),
        onPressed: () {
          //Navigator.of(context).pop();
          if (_fechaReserva != "") {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text("Codigo de Reserva"),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          "AG6SH4S",
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
                      const Text("fecha: 10/09/2022 hora: 8:00hs",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          )),
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
          }
        },
      ),
    );
  }
}
