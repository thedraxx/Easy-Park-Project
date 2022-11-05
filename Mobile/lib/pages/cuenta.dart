import 'package:easy_park/class/users.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/pages/hist_reservas.dart';
import 'package:easy_park/pages/page_login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cuenta extends StatefulWidget {
  Cuenta({Key? key}) : super(key: key);

  @override
  State<Cuenta> createState() => _CuentaState();
}

late var ProviderUser;

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    ProviderUser = Provider.of<User>(context);
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${ProviderUser.getNombre}",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: azuloscuro,
                    ),
                  ),
                  Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/avatar.jpg')))),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "${ProviderUser.getMail}",
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: azuloscuro,
                ),
              )
            ],
          ),
        ),
        Divider(color: azuloscuro, height: 2.0),
        const SizedBox(
          height: 15.0,
        ),
        Column(
          children: [
            Container(
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      elevation: 10.0,
                      textStyle: TextStyle(color: claro),
                      backgroundColor: azuloscuro,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HistorialRes()))
                    },
                    icon: Icon(
                      Icons.book_sharp,
                      color: claro,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Operaciones',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: claro,
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      elevation: 10.0,
                      textStyle: TextStyle(color: claro),
                      backgroundColor: azuloscuro,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () => {},
                    icon: Icon(
                      Icons.settings,
                      color: claro,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Configuracion',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: claro,
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      elevation: 10.0,
                      textStyle: TextStyle(color: claro),
                      backgroundColor: azuloscuro,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () => {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          backgroundColor: claro,
                          title: Text('Cerrar sesion',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: azuloscuro)),
                          content: Text('¿Desea cerrar sesion?',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                  color: azuloscuro)),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancelar'),
                              child: Text('Cancelar',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      color: azuloscuro)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login()));
                              },
                              child: Text('si',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      color: azuloscuro)),
                            ),
                          ],
                        ),
                      )
                    },
                    icon: Icon(
                      Icons.close_sharp,
                      color: claro,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Cerrar sesion',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: claro,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
