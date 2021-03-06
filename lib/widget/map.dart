import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Primera prueba mapas'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _primeraPosicion(),
            ),
            FloatingActionButton(
              onPressed: _getCurrentLocation(),
              child: Icon(Icons.navigation),
              backgroundColor: Colors.green,
            )
          ],
        ));
  }

  CameraPosition _primeraPosicion() {
    _getCurrentLocation();
    CameraPosition _initialPosition = CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude));
    return _initialPosition;
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
    print(_currentPosition);
  }
}
