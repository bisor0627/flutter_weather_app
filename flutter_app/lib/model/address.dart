import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loca;

class Address {
  final double? lat;
  final double? lon;
  Address({this.lat, this.lon});
  factory Address.fromLocation(Location location) {
    return Address(lat: location.latitude, lon: location.longitude);
  }
  factory Address.fromLocationData(loca.LocationData? locationData) {
    return Address(lat: locationData!.latitude, lon: locationData.longitude);
  }
}
