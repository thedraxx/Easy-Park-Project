import 'package:easy_park/colors/color.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: azuloscuro,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/avatar.jpg')))),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Easy Park",
                            style: TextStyle(color: claro, fontSize: 15)),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: claro,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 6,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: claro,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          cursorColor: azuloscuro,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 14, right: 15),
                              hintText: 'Buscar',
                              hintStyle: TextStyle(
                                color: azuloscuro,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w200,
                              ),
                              labelStyle: TextStyle(color: azulClaro),
                              suffixIcon: IconButton(
                                  splashRadius: 20,
                                  onPressed: () {},
                                  icon: const Icon(Icons.clear))),
                        ),
                      )),

                  Expanded(
                    flex: 1,
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: claro,
                          size: 20,
                        )),
                  ),
                  //  ),
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
