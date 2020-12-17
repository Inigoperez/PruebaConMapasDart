import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mapa/providers/GPS.dart';
import 'widget/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GPS(),
      child: MaterialApp(
        title: 'Prueba con Mapa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Mapa(),
      ),
    );
  }
}
