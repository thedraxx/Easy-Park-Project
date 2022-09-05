import 'package:easy_park/colors/color.dart';
import 'package:easy_park/pages/page_login/login.dart';
//import 'package:easy_park/widgets/botones_categ.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          color: azul,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20.0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: claro,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Easy Park",
                          style: TextStyle(color: claro, fontSize: 15)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        icon: Icon(
                          Icons.menu,
                          color: claro,
                        )),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 280,
                      decoration: BoxDecoration(
                        color: azulclaro,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        cursorColor: claro,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 14, right: 15),
                            hintText: 'Buscar',
                            hintStyle: TextStyle(
                              color: claro,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w100,
                            ),
                            labelStyle: TextStyle(color: claro),
                            suffixIcon: IconButton(
                                splashRadius: 20,
                                onPressed: () {},
                                icon: const Icon(Icons.clear))),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: claro,
                          size: 20,
                        )),
                  ),
                ],
              ),
              //Boton_cat(),
            ],
          ),
        ),
        //CONTENEDO DE BOTONES DE CATEGORIA
        /* Container(
          height: 100,
          child: const Boton_cat(),
        )*/
      ],
    );
  }
}
