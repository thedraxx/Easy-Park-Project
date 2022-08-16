import 'package:easy_park/class/Proveedores.dart';
import 'package:easy_park/classApi/httpProv.dart';
import 'package:easy_park/colors/color.dart';
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

  final someOtherSliver = SliverToBoxAdapter(
    child: Text("Hola"),
  );

  @override
  void initState() {
    super.initState();
    final Apisprovs = Apisprov();
    futureProv = Apisprovs.fetchProveedores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(280), child: Navbar()),
      body: FutureBuilder(
          key: const Key('futureBuilder'),
          future: futureProv,
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              asyncSnapshotHelper(snapshot)),
    );
  }
}







//ANTERIO


/*
CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          floating: true,
          snap: false,
          expandedHeight: 130.0,
          backgroundColor: azul,
          title: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: claro,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text("Easy Park", style: TextStyle(color: claro, fontSize: 15)),
            ],
          ),

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ),
          ],
          bottom: AppBar(
            toolbarHeight: 100,
            backgroundColor: azul,
            elevation: 0,
            title: Container(
              decoration: BoxDecoration(
                color: azulclaro,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: myController,
                cursorColor: claro,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 15, bottom: 11, top: 14, right: 15),
                    hintText: 'Buscar',
                    hintStyle: TextStyle(color: claro),
                    labelStyle: TextStyle(color: claro),
                    suffixIcon: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: const Icon(Icons.clear))),
              ),
            ),
            actions: [
              IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                  ))
            ],
          ), //<Widget>[]
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Boton_cat(),
          SizedBox(height: 35),
        ])),
      ],
    );
*/

















    /*Scaffold(
      appBar: AppBar(
        title: const Text(
          "Busquemos el mejor lugar",
          style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
        ),
        backgroundColor: azul,
        toolbarHeight: 200,
        elevation: 0,
        flexibleSpace: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: claro,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu_outlined),
                    color: claro),
              ),
            ]),
          ]),
        ),
      ),
      body: ListView(children: const [
        Boton_cat(),
        SizedBox(
          height: 35,
        ),
        Card_Prov()
      ]),
    );*/