import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:crypto_link/data/models/location.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  late Rx<LocationClass> _location = LocationClass(
    city: '',
    country: '',
    department: '',
    latitude: '',
    longitude: '',
  ).obs;
  late Rx<dynamic> _posicionlat = "".obs;
  late Rx<dynamic> _posicionlo = "".obs;
  late Rx<String> _city = "".obs;
  late Rx<String> _department = "".obs;
  late Rx<String> _country = "".obs;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  LocationClass get location => _location.value;
  String get locationlat => _posicionlat.value;
  String get locationlo => _posicionlo.value;
  String get city => _city.value;
  String get department => _department.value;
  String get country => _country.value;
  AuthController controllerAuth = Get.find();

  Future<void> obtenerubicacion() async {
    late LocationData _posicion;
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

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

    _posicion = await location.getLocation();

    print('Posicion:-> ' + _posicion.toString());
    _posicionlat.value = _posicion.latitude.toString();
    _posicionlo.value = _posicion.longitude.toString();

    if (_posicion.latitude != null && _posicion.longitude != null) {
      List<geocoding.Placemark> placemark = await geocoding
          .placemarkFromCoordinates(_posicion.latitude!, _posicion.longitude!);
      _city.value = placemark[0].locality.toString();
      _department.value = placemark[0].administrativeArea.toString();
      _country.value = placemark[0].country.toString();

      LocationClass newLocation = LocationClass(
        city: _city.value,
        country: _country.value,
        department: _department.value,
        latitude: _posicionlat.value,
        longitude: _posicionlo.value,
      );
      _location.value = newLocation;
      await uploadLocation(
        controllerAuth.getUid(), newLocation);
      print(placemark);
    }
  }

  Future uploadLocation(String uid, LocationClass newLocation) async {
    await userCollection.doc(uid).update(newLocation.toJson());
  }

  getLocations(String uid) {
    return userCollection.where('uid', isNotEqualTo: uid).snapshots();
  }

  double getDistanceBetweenKm(
      {required double startLatitude,
      required double startLongitude,
      required double endLatitude,
      required double endLongitude}) {
    double distanceInKMeters = Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);

    distanceInKMeters = distanceInKMeters / 1000;
    return distanceInKMeters;
  }
}
