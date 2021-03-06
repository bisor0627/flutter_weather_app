import 'package:flutter/material.dart';
import 'package:flutter_app/model/models.dart';
import 'package:flutter_app/util/api_call.dart';

class WeatherData with ChangeNotifier {
  Weather _weather = Weather();
  APICallService apiCallService = APICallService();
  Weather get weather => _weather;

  void setWeatherFromAddress(Address address) async {
    if (address.lat == null || address.lon == null) {
      address = Address.fromDouble(latitude: 37.513272, longitude: 127.094317);
    }
    _weather = await apiCallService.makeAPICall(address: address);
    print("set Weather From Address ${_weather.timezone}");
    notifyListeners();
  }

  void setWeather(Weather weather) {
    _weather = weather;
    print("set Weather ${_weather.timezone}");
    notifyListeners();
  }
}
