import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GPS with ChangeNotifier {
  CameraPosition _posicion;
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  initState() {
    actualizar();
  }

  // ignore: non_constant_identifier_names
  CameraPosition get mi_posicion {
    print("-----get---" + _posicion.toString());
    return _posicion;
  }

  actualizar() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _posicion = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 13.151926040649414);
      print("-----actualizar---" + _posicion.toString());
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }

  CameraPosition inicio() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _posicion = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 13.151926040649414);
      print("-----actualizar---" + _posicion.toString());
      return mi_posicion;
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }
}
