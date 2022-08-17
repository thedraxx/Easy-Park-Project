import 'package:easy_park/class/userlocation.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/location.dart';
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

  @override
  void initState() {
    super.initState();
    mapController = MapController();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: azul,
        title: Text(
          "(Lat: ${userLocation.latitude} - Long: ${userLocation.longitude}) ",
          style: const TextStyle(fontSize: 13.0),
        ),
      ),
      body: Center(
          child: FlutterMap(
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

          /* MarkerLayerOptions(
            markers: [
             // proveedores()
              /* Marker(
                width: 80.0,
                height: 80.0,
                point: userLocation, //userLocation,
                builder: (ctx) => GestureDetector(
                  onLongPress: () {},
                  child: const Icon(
                    Icons.circle,
                    color: Colors.deepPurpleAccent,
                    size: 18.0,
                  ),
                ),
              ),*/
            ],
          ),*/
        ],
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: () {},
          ),
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
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
            onPressed: _center,
            tooltip: 'center',
            backgroundColor: azul,
            child: const Icon(Icons.center_focus_strong),
          ),
        ],
      ),
    );
  }

//CENTRA MAP
  void _center() {
    _animatedMapMove(userLocation, 16.0, true);
  }

//OBTIENE POSICION ACTUAL Y RE DIBUJA WIDGET
  Future<void> _NewLocation(currentPosition) async {
    ProviderLocation.position = await currentPosition;
    print("LA POSITION ES $currentPosition");
    _animatedMapMove(currentPosition, 16.0, false);
  }

  /* proveedores() {
    print('funciona');
    return Marker(
      width: 80.0,
      height: 80.0,
      point: userLocation, //userLocation,
      builder: (ctx) => GestureDetector(
        onLongPress: () {},
        child: const Icon(
          Icons.circle,
          color: Colors.deepPurpleAccent,
          size: 18.0,
        ),
      ),
    );
  }*/
}
