import 'package:flutter_app/model/models.dart';

class Day {
  final int? dt;
  final int? sunrise; //
  final int? sunset; //
  final int? moonrise; //
  final int? moonset; //
  final num? moon_phase; //
  final Temp? temp; //
  final FeelsLike? feels_like; //
  final int? pressure;
  final int? humidity;
  final num? dew_point;
  final num? wind_speed;
  // final num? wind_deg;
  final num? wind_gust;
  final WeatherID? weather;
  final int? clouds;
  final num? pop; //
  final num? uvi; //

  Day(
      {this.dt,
      this.sunrise, //
      this.sunset, //
      this.moonrise, //
      this.moonset, //
      this.moon_phase, //
      this.temp, //
      this.feels_like, //
      this.pressure,
      this.humidity,
      this.dew_point,
      this.wind_speed,
      // this.wind_deg,
      this.wind_gust,
      this.weather,
      this.clouds,
      this.pop, //
      this.uvi //
      });

  factory Day.fromSnapshot(Map<String, dynamic> snapshot) {
    return Day(
        dt: snapshot['dt'],
        //sunrise: snapshot['sunrise'],
        //sunset: snapshot['sunset'],
        //moonrise: snapshot['moonrise'],
        //moonset: snapshot['moonset'],
        //moon_phase: snapshot['moon_phase'],
        temp: Temp.fromSnapshot(snapshot['temp']),
        //feels_like: snapshot['feels_like'],
        pressure: snapshot['pressure'],
        humidity: snapshot['humidity'],
        dew_point: snapshot['dew_point'],
        wind_speed: snapshot['wind_speed'],
        // wind_deg: snapshot['wind_deg'],
        // wind_gust: snapshot['wind_gust'],
        weather: WeatherID.fromSnapshot(snapshot['weather'][0]),
        clouds: snapshot['clouds']
        //pop: snapshot['pop'],
        //uvi: snapshot['uvi']
        );
  }
}
