import 'package:flutter/services.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:location/location.dart';

class CurrentLocation {
  final Location _location = Location();
// get Location

  Future<Address> getLocation() async {
    LocationData? locationResult;
    try {
      locationResult = await _location.getLocation();
    } on PlatformException catch (err) {
      err.code;
    }

    return Address.fromLocationData(locationResult);
  }
}
