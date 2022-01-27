import 'package:flutter_app/model/models.dart';

class Current {
  final num? dt;
  final num? sunrise;
  final num? sunset;
  final num? temp;
  final num? feels_like;
  final num? pressure;
  final num? humidity;
  final num? dew_point;
  final num? uvi;
  final num? clouds;
  final num? visibility;
  final num? wind_speed;

  /// int -> num
  /// num->int
  /// 계속 에러 발생함
  final num? wind_deg;
  final WeatherID? weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feels_like,
      this.pressure,
      this.humidity,
      this.dew_point,
      this.uvi,
      this.clouds,
      this.visibility,
      this.wind_speed,
      this.wind_deg,
      this.weather});
  factory Current.fromSnapshot(Map<String, dynamic> snapshot) {
    return Current(
        dt: snapshot['dt'],
        sunrise: snapshot['sunrise'],
        sunset: snapshot['sunset'],
        temp: snapshot['temp'],
        feels_like: snapshot['feels_like'],
        pressure: snapshot['pressure'],
        humidity: snapshot['humidity'],
        dew_point: snapshot['dew_point'],
        uvi: snapshot['uvi'],
        clouds: snapshot['clouds'],
        visibility: snapshot['visibillity'],
        wind_speed: snapshot['wind_speed'],
        // wind_deg: num.parse(snapshot['wind_speed']),
        weather: WeatherID.fromSnapshot(snapshot['weather'][0]));
  }
}
