import 'package:location/location.dart';

import 'package:latlong2/latlong.dart';

Location location = Location();
bool _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.granted;
LocationData _locationData = LocationData.fromMap({});

Future<void> initializeLocationAndSave(Function newLocation) async {
  _serviceEnabled = await location.serviceEnabled();

  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }
  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  _locationData = await location.getLocation();
  double lat = double.parse('${_locationData.latitude}');
  double long = double.parse('${_locationData.longitude}');
  var currentPosition = LatLng(lat, long);

  return newLocation(currentPosition);
}


/*

NOTICICAR CAMBIOS DE POSICION 
void update() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      geo();
    });

*/