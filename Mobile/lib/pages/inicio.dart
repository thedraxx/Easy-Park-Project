import 'package:easy_park/class/Proveedores.dart';
import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/helpers/asyncSnapshotHelper.dart';
import 'package:easy_park/widgets/navbar.dart';

import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final myController = TextEditingController();

  late Future<List<Proveedores>> futureProv;

  @override
  void initState() {
    super.initState();
    final Apisprovs = PeticionesHttp();
    futureProv = Apisprovs.fetchProveedores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(160), child: Navbar()),
      body: FutureBuilder(
          key: const Key('futureBuilder'),
          future: futureProv,
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              asyncSnapshotHelper(snapshot)),
    );
  }
}
