import 'package:easy_park/classApi/httpPeticiones.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/validacion.dart';

import 'package:easy_park/home.dart';
import 'package:easy_park/pages/page_login/Registro.dart';
import 'package:easy_park/pages/page_login/reset_pass.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  late String _usuario;
  late String _pass;
  final UsuarioController = TextEditingController();
  final PassController = TextEditingController();
  bool _hide = true;
  bool consulta = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Easy Park",
                  style: TextStyle(
                    color: azul,
                    fontSize: 25.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20.0),
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: claro,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: UsuarioController,
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
                            icon: const Icon(Icons.person))),
                    onSaved: (newValue) => _usuario = newValue!,
                  )),
              const SizedBox(height: 20.0),
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: claro,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: PassController,
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
                        hintText: 'Contraseña',
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
                                : const Icon(Icons.remove_red_eye_sharp))),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResetPass()));
                },
                child: const Text('Olvide mi contraseña',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registro()));
                },
                child: Text('Registrarse', style: TextStyle(color: azul)),
              ),
              const SizedBox(
                height: 5.0,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: MaterialButton(
                  minWidth: 300.0,
                  height: 50.0,
                  onPressed: () {
                    /* Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()));*/

                    final form = _formkey.currentState;
                    if (form!.validate()) {
                      form.save();
                      PeticionesHttp()
                          .ConsultaLogin(
                              UsuarioController.text, PassController.text)
                          .then((result) {
                        if (result == true) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Home()));
                        } else {
                          UsuarioController.clear();
                          PassController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: naranja,
                            elevation: 10.0,
                            content: Text(
                              'Usuario incorrecta',
                              style: TextStyle(color: azul),
                            ),
                            duration: const Duration(seconds: 1),
                          ));
                        }
                      });
                    }
                  },
                  color: azul,
                  child: Text('Login', style: TextStyle(color: claro)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _update() => setState(() {});
}
