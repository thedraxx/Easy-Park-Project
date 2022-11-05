import 'dart:async';

import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/validacion.dart';
import 'package:easy_park/pages/page_login/login.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formkeyReg = GlobalKey<FormState>();
  late String _email;
  String _pass = "";
  late String _nombre;
  late String _localidad;
  final nombreController = TextEditingController();
  final myController = TextEditingController();
  final UsuarioController = TextEditingController();
  final LocalidadController = TextEditingController();
  final telController = TextEditingController();
  late String _tel;
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_rounded, color: azuloscuro)),
      ),
      body: Center(
        child: ListView(
          children: [
            Form(
              key: _formkeyReg,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Registro",
                      style: TextStyle(
                        color: azuloscuro,
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: claro,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: azulmedio),
                          ),
                          child: TextFormField(
                            controller: nombreController,
                            validator: (value) => ValidaNombre(value!),
                            cursorColor: azulmedio,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Nombre',
                                hintStyle: TextStyle(
                                  color: azuloscuro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                                labelStyle: TextStyle(color: azuloscuro),
                                suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(Icons.person))),
                            onSaved: (newValue) => _nombre = newValue!,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: claro,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: azulmedio),
                          ),
                          child: TextFormField(
                            controller: UsuarioController,
                            validator: (value) => ValidaUsuario(value!),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: azulmedio,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: azuloscuro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                                labelStyle: TextStyle(color: azuloscuro),
                                suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(Icons.email))),
                            onSaved: (newValue) => _email = newValue!,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: claro,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: azulmedio),
                          ),
                          child: TextFormField(
                            controller: telController,
                            validator: (value) => ValidaTel(value!),
                            keyboardType: TextInputType.phone,
                            cursorColor: azulmedio,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Telefono',
                                hintStyle: TextStyle(
                                  color: azuloscuro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                                labelStyle: TextStyle(color: azuloscuro),
                                suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(Icons.phone))),
                            onSaved: (newValue) => _tel = newValue!,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: claro,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: azulmedio),
                          ),
                          child: TextFormField(
                            controller: LocalidadController,
                            validator: (value) => ValidaNombre(value!),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: azulmedio,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Localidad',
                                hintStyle: TextStyle(
                                  color: azuloscuro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                                labelStyle: TextStyle(color: azuloscuro),
                                suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(Icons.location_on))),
                            onSaved: (newValue) => _localidad = newValue!,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: claro,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: azulmedio),
                          ),
                          child: TextFormField(
                            controller: myController,
                            validator: (value) => ValidaPass(value!),
                            onSaved: (newValue) => _pass = newValue!,
                            obscureText: _hide,
                            cursorColor: azulmedio,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Ingresar contraseña',
                                hintStyle: TextStyle(
                                  color: azuloscuro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                                labelStyle: TextStyle(color: azuloscuro),
                                suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () =>
                                        _hide = OcultarWidget(_update, _hide),
                                    icon: _hide
                                        ? const Icon(Icons.password)
                                        : const Icon(
                                            Icons.remove_red_eye_sharp))),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: claro,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: azulmedio),
                          ),
                          child: TextFormField(
                            validator: (value) =>
                                ValidaIgualPass(value, myController.text),
                            obscureText: _hide,
                            cursorColor: azulmedio,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Repetir contraseña',
                                hintStyle: TextStyle(
                                  color: azuloscuro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                                labelStyle: TextStyle(color: azuloscuro),
                                suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () =>
                                        _hide = OcultarWidget(_update, _hide),
                                    icon: _hide
                                        ? const Icon(Icons.password)
                                        : const Icon(
                                            Icons.remove_red_eye_sharp))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: MaterialButton(
                      minWidth: 300.0,
                      height: 50.0,
                      onPressed: () {
                        final form = _formkeyReg.currentState;
                        if (form!.validate()) {
                          form.save();
                          PeticionesHttp()
                              .RegistraDb(
                                  nombreController.text,
                                  UsuarioController.text,
                                  LocalidadController.text,
                                  myController.text,
                                  telController.text)
                              .then((result) {
                            String mensaje = result;

                            if (result == "1") {
                              /********* USUARIO REGISTRADO **********/
                              mensaje = "Usuario Registrado";
                              Timer(const Duration(seconds: 2), () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login()));
                              });
                            } else if (result == "0") {
                              /********* ERROR MAIL YA ESTA REGISTRADO **********/
                              mensaje = "El mail ingresade esta registrado";
                            }
                            /********* MUESTRA RESULTADO DE LA OPERACION CON UN MENSAJE **********/
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: naranja,
                              elevation: 10.0,
                              content: Text(
                                mensaje,
                                style: TextStyle(color: azuloscuro),
                              ),
                              duration: const Duration(seconds: 1),
                            ));
                          });
                        }
                      },
                      color: azuloscuro,
                      child:
                          Text('Registrarse', style: TextStyle(color: claro)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//ACTUALIZA WIDGETS
  void _update() => setState(() {});
}
