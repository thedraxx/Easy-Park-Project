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
  final myController = TextEditingController();
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
            icon: Icon(Icons.arrow_back_rounded, color: azul)),
      ),
      body: Center(
        child: ListView(
          children: [
            Form(
              key: _formkeyReg,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("Easy Park",
                      style: TextStyle(
                        color: azul,
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 20.0),
                  Text("Registro",
                      style: TextStyle(
                        color: azul,
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
                          ),
                          child: TextFormField(
                            validator: (value) => ValidaUsuario(value!),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: claro,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: azulclaro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                ),
                                labelStyle: TextStyle(color: azul),
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
                          ),
                          child: TextFormField(
                            validator: (value) => ValidaTel(value!),
                            keyboardType: TextInputType.phone,
                            cursorColor: claro,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Telefono',
                                hintStyle: TextStyle(
                                  color: azulclaro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                ),
                                labelStyle: TextStyle(color: azul),
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
                          ),
                          child: TextFormField(
                            controller: myController,
                            validator: (value) => ValidaPass(value),
                            onSaved: (newValue) => _pass = newValue!,
                            obscureText: _hide,
                            cursorColor: claro,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Ingresar contraseña',
                                hintStyle: TextStyle(
                                  color: azulclaro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                ),
                                labelStyle: TextStyle(color: azul),
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
                          ),
                          child: TextFormField(
                            validator: (value) =>
                                ValidaIgualPass(value, myController.text),
                            obscureText: _hide,
                            cursorColor: claro,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 14, right: 15),
                                hintText: 'Repetir contraseña',
                                hintStyle: TextStyle(
                                  color: azulclaro,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100,
                                ),
                                labelStyle: TextStyle(color: azul),
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

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Login()));
                        }
                      },
                      color: azul,
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
