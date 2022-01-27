import 'dart:convert';
import 'dart:async';

import 'package:flutter_app/model/address.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class APICallService {
  String api_key_weather = "731df39a4bbbee0566e6bcc9528250d9";
  APICallService();

  Future<Weather> makeAPICall({required Address address}) async {
    Map<String, dynamic> response;
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${address.lat}&lon=${address.lon}&exclude=minutely,alerts&appid=${api_key_weather}&units=metric&lang=kr');

    print(uri);
    final client = RetryClient(http.Client());
    try {
      response =
          json.decode(utf8.decode(await client.readBytes(uri)).toString());

      Weather weather = Weather.fromSnapshot(response);

      return weather;
    } finally {
      client.close();
    }
  }
}
