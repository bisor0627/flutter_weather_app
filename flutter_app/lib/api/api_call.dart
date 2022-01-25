import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:location/location.dart';

class APICallService {
  String api_key_weather = "731df39a4bbbee0566e6bcc9528250d9";
  APICallService();
/*
  Future<Map<String, dynamic>> makeAPICall(
      {required LocationData futurelocationData}) async {

    print("${locationData.latitude} ${locationData.longitude}");

    Map<String, dynamic> response;
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${locationData.latitude}t&lon=${locationData.longitude}&exclude=minutely,alerts&appid=${api_key_weather}&units=metric&lang=kr');

    print(uri);
    final client = RetryClient(http.Client());
    try {
      response =
          json.decode(utf8.decode(await client.readBytes(uri)).toString());

      // Weather weather = Weather.fromMap(response);
      // printJson(weather.toMap());
      return response;
    } finally {
      client.close();
    }
  }
 */

  Future<Map<String, dynamic>> makeAPICall(
      {required Future<LocationData?> futurelocationData}) async {
    LocationData? locationData = await futurelocationData;
    print("${locationData?.latitude} ${locationData?.longitude}");

    Map<String, dynamic> response;
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${locationData?.latitude}t&lon=${locationData?.longitude}&exclude=minutely,alerts&appid=${api_key_weather}&units=metric&lang=kr');

    print(uri);
    final client = RetryClient(http.Client());
    try {
      response =
          json.decode(utf8.decode(await client.readBytes(uri)).toString());

      // Weather weather = Weather.fromMap(response);
      // printJson(weather.toMap());
      return response;
    } finally {
      client.close();
    }
  }
}
