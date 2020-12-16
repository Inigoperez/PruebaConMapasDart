import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GPS with ChangeNotifier {
  CameraPosition _posicion;
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
    actualizar();
  }

  get posicion {
    return _posicion;
  }

  actualizar() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _posicion =
          CameraPosition(target: LatLng(position.latitude, position.longitude));
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }
}
