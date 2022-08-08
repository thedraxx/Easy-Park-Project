/*import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

Location location = Location();
bool _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.granted;
LocationData _locationData = LocationData.fromMap({});

Future<void> initializeLocationAndSave() async {
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

  // Get capture the current user location
  //LocationData _locationData = await _location.getLocation();
  // LatLng currentLatLng =LatLng(_locationData.latitude!, _locationData.longitude!);

/*
  ProviderLocation.latitud = lat;
  ProviderLocation.longitud = long;
  ProviderLocation.state = true;*/

  // print("FUNCION : LATITUD ${lat} LONGITUD ${long}");
  // print(" LOCATION FUNCIONA $currentLatLng");
}*/

/*void update() {
  location.onLocationChanged.listen((LocationData currentLocation) {
    geo();
  });
}*/
