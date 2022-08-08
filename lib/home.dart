import 'package:easy_park/colors/color.dart';

import 'package:easy_park/pages/inicio.dart';
import 'package:easy_park/pages/map.dart';
import 'package:easy_park/pages/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'class/userlocation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late var ProviderLocation;
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.granted;
  LocationData _locationData = LocationData.fromMap({});

  @override
  void initState() {
    setState(() {
      initializeLocationAndSave();
      print("Inicio HOME");
    });
    super.initState();
  }

  int _selectedIndex = 0;
  final pages = [
    const Inicio(),
    const PageMap(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ProviderLocation = Provider.of<UserLocation>(context);
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          backgroundColor: gris,
          fixedColor: azul,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ajustes',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> initializeLocationAndSave() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    double lat = double.parse('${_locationData.latitude}');
    double long = double.parse('${_locationData.longitude}');
    ProviderLocation.latitud = lat;
    ProviderLocation.longitud = long;
    // ProviderLocation.state = true;

    print("FUNCION : LATITUD ${lat} LONGITUD ${long}");
    setState(() {});
  }

  /*void update() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      geo();
    });
  }*/
}
