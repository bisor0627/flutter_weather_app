import 'package:flutter_app/model/models.dart';

class Weather {
  final num? lat;
  final num? lon;
  final String? timezone;
  final int? timezone_offset;
  final Current? current;
  final List<Day>? daily;
  final List<Hour>? hourly;

  Weather(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezone_offset,
      this.current,
      this.daily,
      this.hourly});

  factory Weather.fromSnapshot(Map<String, dynamic> snapshot) {
    return Weather(
        lat: snapshot['lat'] ?? 0.0,
        lon: snapshot['lon'] ?? 0.0,
        timezone: snapshot['timezone'] ?? "",
        timezone_offset: snapshot['timezone_offset'] ?? 0,
        current: Current.fromSnapshot(snapshot['current']),
        daily: (snapshot['daily'] as List<dynamic>)
            .map((e) => Day.fromSnapshot(e))
            .toList(),
        // daily:
        //     List<Day>.from(snapshot['daily'].map((x) => Day.fromSnapshot(x))),
        hourly: List<Hour>.from(
            snapshot['hourly'].map((x) => Hour.fromSnapshot(x))));
  }
}
