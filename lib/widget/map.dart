import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mapa/providers/GPS.dart';

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    final posicion = Provider.of<GPS>(context);

    Completer<GoogleMapController> _controller = Completer();
    print("dentro de widget --1--");
    print(posicion.mi_posicion);
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    CameraPosition isNullLocation() {
      print("dentro del isNullLocation --2--");
      print(posicion.mi_posicion);
      if (posicion.mi_posicion == null) {
        posicion.actualizar();
        return posicion.mi_posicion;
      } else {
        return posicion.mi_posicion;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: isNullLocation(),
            /*initialCameraPosition: CameraPosition(
              target: LatLng(43.24687, -1.991704),
              zoom: 13.151926040649414,
            ),*/
            mapType: MapType.normal,
          ),
          FloatingActionButton(
            onPressed: () => posicion.actualizar(),
            child: Icon(Icons.navigation),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
