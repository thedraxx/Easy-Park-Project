import 'package:easy_park/class/userlocation.dart';
import 'package:easy_park/colors/color.dart';
import 'package:easy_park/home.dart';
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
        ChangeNotifierProvider(create: (_) => UserLocation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Map',
        color: azul,
        home: const Home(),
      ),
    );
  }
}

//flutter clean
//flutter run --release

/*
*    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
        <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
*
* */

