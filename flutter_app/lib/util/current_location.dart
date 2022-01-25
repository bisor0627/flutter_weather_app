import 'package:flutter/services.dart';
import 'package:location/location.dart';

class CurrentLocation {
  final Location _location = Location();
// get Location

  Future<LocationData?> getLocation() async {
    LocationData? locationResult;
    try {
      locationResult = await _location.getLocation();
    } on PlatformException catch (err) {
      err.code;
    }
    return locationResult;
  }
}
