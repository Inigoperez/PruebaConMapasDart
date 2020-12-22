import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GPS with ChangeNotifier {
  CameraPosition _posicion;
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  initState() {
    actualizar();
  }

  setState(posicion) {
    _posicion = posicion;
  }

  // ignore: non_constant_identifier_names
  get mi_posicion {
    print("-----get---" + _posicion.toString());
    if (_posicion == null) {
      setState(CameraPosition(
          target: LatLng(40.463667, -3.74922), zoom: 5.151926040649414));
      return _posicion;
    } else {
      return _posicion;
    }
  }

  actualizar() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 13.151926040649414));
      print("-----actualizar---" + _posicion.toString());
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }
}
