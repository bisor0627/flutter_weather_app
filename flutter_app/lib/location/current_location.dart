import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class CurrentLocation {
  final Location _location = Location();
  bool _loading = false;
  static LocationData? location;
  String? _error;

//permission

  Future<bool> checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await _location.hasPermission();
    permissionGrantedResult == PermissionStatus.granted
        ? null
        : _requestPermission(permissionGrantedResult);
    return _checkService();
  }

  Future<void> _requestPermission(
      PermissionStatus permissionGrantedResult) async {
    if (permissionGrantedResult != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await _location.requestPermission();
      permissionGrantedResult = permissionRequestedResult;
    }
  }

// service Enable

  Future<bool> _checkService() async {
    bool serviceEnabledResult = await _location.serviceEnabled();

    if (serviceEnabledResult == true) {
      return serviceEnabledResult;
    }
    serviceEnabledResult = await _location.requestService();

    return serviceEnabledResult;
  }

// get Location

  Future<LocationData?> getLocation() async {
    _error = null;
    _loading = true;

    try {
      final LocationData _locationResult = await _location.getLocation();

      location = _locationResult;
      _loading = false;
    } on PlatformException catch (err) {
      _error = err.code;
      _loading = false;
    }
    return location;
  }
}
