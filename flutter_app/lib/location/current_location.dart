import 'package:flutter/services.dart';
import 'package:location/location.dart';

class CurrentLocation {
  final Location _location = Location();

//permission----------------------------------
  Future<bool> checkPermissions() async {
    bool result = false;
    PermissionStatus requestPermission;
    final PermissionStatus permissionGrantedResult =
        await _location.hasPermission();

    if (permissionGrantedResult == PermissionStatus.granted) {
      result = true;
    }
    requestPermission = await _requestPermission(permissionGrantedResult);
    if (requestPermission == PermissionStatus.granted) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }

  Future<PermissionStatus> _requestPermission(
      PermissionStatus permissionGrantedResult) async {
    if (permissionGrantedResult != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await _location.requestPermission();
      return permissionRequestedResult;
    } else {
      return permissionGrantedResult;
    }
  }

// service Enable----------------------------------
  Future<bool> checkService() async {
    bool serviceEnabledResult = await _location.serviceEnabled();

    if (serviceEnabledResult == true) {
      return serviceEnabledResult;
    }
    serviceEnabledResult = await _location.requestService();

    return serviceEnabledResult;
  }
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
