import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ShareVar {
  static String api_key_weather = "731df39a4bbbee0566e6bcc9528250d9";
}

class APICallService {
  APICallService();

  /// Makes a GET call to figma using `url` and `token`
  Future<Map<String, dynamic>> makeAPICall(
      {required double lat, required double long}) async {
    Map<String, dynamic> response;
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=minutely,hourly,daily,alerts&appid=${ShareVar.api_key_weather}&units=metric&lang=kr');

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
