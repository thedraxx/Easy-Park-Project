import 'package:easy_park/colors/color.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
              title: Text("${widget.nombre}"),
              background: Image.network(
                widget.imagen,
                fit: BoxFit.cover,
              )),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            height: 300,
            width: 300,
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
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        backgroundColor: azul,
        label: const Text('Reservar'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
