import 'package:flutter_app/model/models.dart';

class Hour {
  final int? dt;
  final num? temp;
  final num? feels_like;
  final int? pressure;
  final int? humidity;
  final num? dew_point;
  final num? uvi;
  final int? clouds;
  final int? visibility;
  final num? wind_speed;
  // final num? wind_deg;
  final num? wind_gust;
  final WeatherID? weather;
  final int? pop;

  Hour(
      {this.dt,
      this.temp,
      this.feels_like,
      this.pressure,
      this.humidity,
      this.dew_point,
      this.uvi,
      this.clouds,
      this.visibility,
      this.wind_speed,
      // this.wind_deg,
      this.wind_gust,
      this.weather,
      this.pop});

  factory Hour.fromSnapshot(Map<String, dynamic> snapshot) {
    return Hour(
        dt: snapshot['dt'],
        temp: snapshot['temp'],
        feels_like: 0.0, //snapshot['feels_like']
        pressure: snapshot['pressure'],
        humidity: snapshot['humidity'],
        // dew_point: snapshot['dew_point'],
        // uvi: snapshot['uvi'],
        clouds: snapshot['clouds'],
        visibility: snapshot['visibility'],
        // wind_speed: snapshot['wind_speed'],
        // wind_deg: snapshot['wind_deg'],
        // wind_gust: snapshot['wind_gust'],
        weather: WeatherID.fromSnapshot(snapshot['weather'][0]),
        pop: snapshot['pop']);
  }
}
