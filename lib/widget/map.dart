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

    print("dentro de widget --line 20--");
    print(posicion.mi_posicion);

    return Stack(
      children: <Widget>[
        _widgetMapa(posicion.mi_posicion),
        FloatingActionButton(
          onPressed: () => posicion.actualizar(),
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
      ],
    );
  }

  Widget _widgetMapa(CameraPosition position) {
    Completer<GoogleMapController> _controller = Completer();
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: position,
      mapType: MapType.normal,
    );
  }
}
