import 'package:easy_park/class/users.dart';
import 'package:easy_park/class/usersData.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/pages/page_login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => userData()),
        ChangeNotifierProvider(create: (_) => User()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Easy Park',
        color: azuloscuro,
        home: Login(),
      ),
    );
  }
}
