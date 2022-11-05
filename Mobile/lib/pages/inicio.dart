import 'package:easy_park/class/Proveedores.dart';
import 'package:easy_park/class/usersData.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/asyncSnapshotHelper.dart';
import 'package:easy_park/helpers/location.dart';
import 'package:easy_park/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final myController = TextEditingController();
  late var ProviderLocation;
  late LatLng userLocation;

  late Future<List<Proveedores>> futureProv;

  @override
  void initState() {
    super.initState();
    final Apisprovs = PeticionesHttp();
    futureProv = Apisprovs.fetchProveedores();
  }

  @override
  Widget build(BuildContext context) {
    ProviderLocation = Provider.of<userData>(context);
    userLocation = ProviderLocation.UserPosition;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(160), child: Navbar()),
      body: RefreshIndicator(
        backgroundColor: claro,
        color: azulClaro,
        onRefresh: _actualizar,
        child: FutureBuilder(
            key: const Key('futureBuilder'),
            future: futureProv,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                asyncSnapshotHelper(snapshot, userLocation, context)),
      ),
    );
  }

//**** ACTUALIZA PETICION HTTP  ***//
  Future<void> _actualizar() async {
    initializeLocationAndSave(_NewLocation);
    futureProv = PeticionesHttp().fetchProveedores();
    const duracion = Duration(seconds: 2);
    Timer(duracion, () {
      setState(() {});
    });
    return Future.delayed(duracion);
  }

  //********* ACTUALIZA POSICION *************//
  Future<void> _NewLocation(currentPosition) async {
    ProviderLocation.position = await currentPosition;
  }
}
