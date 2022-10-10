import 'dart:async';
import 'dart:convert';

import 'package:easy_park/class/Proveedores.dart';
import 'package:easy_park/class/userlocation.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/location.dart';
import 'package:easy_park/widgets/list_Prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class PageMap extends StatefulWidget {
  const PageMap({super.key});

  @override
  State<PageMap> createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> with TickerProviderStateMixin {
  double controllerZoom = 14;
  late final MapController mapController;
  late var ProviderLocation;
  late LatLng userLocation;
  late Future<List<Proveedores>> futureProv;
  String _nombre = "";
  String _direccion = "";
  String _imagen =
      "https://www.mobileeurope.co.uk/wp-content/uploads/2017/07/images_Generic_Car-park-indoor.jpg";
  double _hide = 0;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    final Apisprovs = PeticionesHttp();
    futureProv = Apisprovs.fetchProveedores();
  }

//ANIMACION DE CENTARDO DE MAPA EN UN POSICION DETERMINADA
  void _animatedMapMove(LatLng destLocation, double destZoom, bool zoomBoton) {
    double zoom;
    if (zoomBoton == false) {
      zoom = mapController.zoom;
    } else {
      zoom = destZoom;
    }
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: zoom);
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    ProviderLocation = Provider.of<UserLocation>(context);
    userLocation = ProviderLocation.UserPosition;

    return Scaffold(
      body: Container(
        child: FutureBuilder(
            key: const Key('futureBuilder'),
            future: futureProv,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Stack(children: [
                  FlutterMap(
                    key: const Key('BuilderMap'),
                    mapController: mapController,
                    options: MapOptions(
                      minZoom: 5,
                      maxZoom: 18,
                      center: userLocation, // userLocation,
                      zoom: controllerZoom,
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

                            point: userLocation, //userLocation,
                            builder: (ctx) => GestureDetector(
                              onLongPress: () {},
                              child: const Icon(
                                Icons.radio_button_on_sharp,
                                color: Colors.deepPurpleAccent,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MarkerLayerOptions(markers: _Estac(snapshot.data)),
                    ],
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                        source: 'OpenStreetMap contributors',
                        onSourceTapped: () {},
                      ),
                    ],
                  ),
                  _Card(),
                ]);
              } else if (snapshot.hasError) {
                return Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off, size: 40.0, color: azul),
                    Text("sin conexion",
                        style: TextStyle(color: azul, fontSize: 15)),
                  ],
                ));
              }
              return Center(
                child: CircularProgressIndicator(
                    backgroundColor: azulclaro, color: claro),
              );
            }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _hide = 0;
              initializeLocationAndSave(_NewLocation);
            },
            tooltip: 'Posicion actual',
            backgroundColor: gris,
            child: Icon(Icons.person_pin_circle_rounded, color: azul),
          ),
          const SizedBox(
            height: 5.0,
          ),
          FloatingActionButton(
            onPressed: () {
              _center(userLocation);
              setState(() {
                _hide = 0;
              });
            },
            tooltip: 'center',
            backgroundColor: azul,
            child: const Icon(Icons.center_focus_strong),
          ),
        ],
      ),
    );
  }

//*******************WIDGET - TARJETA CON DATOS DE ESTACIONAMIENTO*********************//
  Widget _Card() {
    return AnimatedContainer(
      margin: const EdgeInsets.all(3.0),
      height: _hide,
      alignment: Alignment.bottomCenter,
      curve: Curves.decelerate,
      //margin: const EdgeInsets.all(10),
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: () {},
        child: Card(
            elevation: 20.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: ListTile(
                trailing: GestureDetector(
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_imagen),
                        fit: BoxFit.cover,
                      ),
                      color: claro,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                title: Text(
                  _nombre,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: azul,
                  ),
                ),
                subtitle: Text(
                  _direccion,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    color: azul,
                  ),
                ))),
      ),
    );
  }

//***********CENTRA MAP ******************//
  void _center(ubicacion) {
    _animatedMapMove(ubicacion, 16.0, true);
  }

//**********OBTIENE POSICION ACTUAL Y RE DIBUJA WIDGET**********//
  Future<void> _NewLocation(currentPosition) async {
    ProviderLocation.position = await currentPosition;
    print("LA POSITION ES $currentPosition");
    _animatedMapMove(currentPosition, 16.0, false);
  }

//************ LISTA DE ESTACIONAMIENTOS (UBICACION EN EL MAPA) *************//
  List<Marker> _Estac(snaphot) {
    final _listaEstac = <Marker>[];
    int cant = snaphot.length;
    for (int i = 0; i < cant; i++) {
      _listaEstac.add(Marker(
        point: LatLng(snaphot[i].latitud, snaphot[i].longitud),
        width: 80.0,
        height: 80.0,
        builder: (ctx) => GestureDetector(
          onTap: () {
            //print("${snaphot[i].nombre}");
            _center(LatLng(snaphot[i].latitud, snaphot[i].longitud));
            setState(() {
              _nombre = snaphot[i].nombre;
              _direccion = snaphot[i].direccion;
              _imagen = snaphot[i].imagen;
              _hide = 120;
            });
          },
          child: const Icon(
            Icons.location_on,
            color: Colors.redAccent,
            size: 25.0,
          ),
        ),
      ));
    }
    return _listaEstac;
  }
}
