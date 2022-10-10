import 'package:easy_park/class/Proveedores.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/location.dart';

import 'package:easy_park/pages/inicio.dart';
import 'package:easy_park/pages/map.dart';
import 'package:easy_park/pages/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'class/userlocation.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late var ProviderLocation;
  late Future<List<Proveedores>> futureProv;

  bool isOffline = false;

  @override
  void initState() {
    initializeLocationAndSave(_NewLocation);
    final Apisprovs = PeticionesHttp();
    futureProv = Apisprovs.fetchProveedores();
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

//OBTIENE POSICION ACTUAL Y RE DIBUJA WIDGET
  Future<void> _NewLocation(currentPosition) async {
    ProviderLocation.position = await currentPosition;
    setState(() {});
  }
}
