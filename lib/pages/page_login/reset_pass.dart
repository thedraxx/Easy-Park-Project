import 'package:easy_park/colors/color.dart';
import 'package:easy_park/helpers/validacion.dart';
import 'package:easy_park/pages/page_login/login.dart';

import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _LoginState();
}

class _LoginState extends State<ResetPass> {
  final _formpasskey = GlobalKey<FormState>();
  late String _email;

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
        child: Form(
          key: _formpasskey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Text("Restablecer contraseña",
                  style: TextStyle(
                    color: azul,
                    fontSize: 18.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                  )),
              const SizedBox(height: 20.0),
              Container(
                  width: 300,
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
                            icon: const Icon(Icons.person))),
                    onSaved: (newValue) => _email = newValue!,
                  )),
              const SizedBox(height: 20.0),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: MaterialButton(
                  minWidth: 300.0,
                  height: 50.0,
                  onPressed: () {
                    // print("$_email   y $_pass");
                    final form = _formpasskey.currentState;
                    if (form!.validate()) {
                      form.save();

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Login()));
                    }
                  },
                  color: azul,
                  child: Text('Restablecer contaseña',
                      style: TextStyle(color: claro)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
