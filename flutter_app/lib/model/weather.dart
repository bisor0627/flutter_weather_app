import 'dart:convert';

import 'package:flutter/material.dart';

List<Weather> productsResponseFromJson(String str) =>
    List<Weather>.from(json.decode(str).map((x) {
      print(x);
      Weather.fromSnapshot(x);
    }));

class Weather {
  final double? lat;
  final double? lon;
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

  factory Weather.fromSnapshot(AsyncSnapshot<Map<String, dynamic>> snapshot) {
    return Weather(
        lat: snapshot.data!['lat'] ?? 0.0,
        lon: snapshot.data!['lon'] ?? 0.0,
        timezone: snapshot.data!['timezone'] ?? "",
        timezone_offset: snapshot.data!['timezone_offset'] ?? 0,
        current: Current.fromSnapshot(snapshot.data!['current']),
        daily: List<Day>.from(
            snapshot.data!['daily'].map((x) => Day.fromSnapshot(x))),
        hourly: List<Hour>.from(
            snapshot.data!['hourly'].map((x) => Hour.fromSnapshot(x))));
  }
}

class Current {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;
  final double? feels_like;
  final int? pressure;
  final int? humidity;
  final double? dew_point;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? wind_speed;
  // final double? wind_deg;
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
      // this.wind_deg,
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
        // wind_deg: double.parse(snapshot['wind_speed']),
        weather: WeatherID.fromSnapshot(snapshot['weather'][0]));
  }
}

class WeatherID {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherID({this.id, this.main, this.description, this.icon});

  factory WeatherID.fromSnapshot(Map<String, dynamic> snapshot) {
    return WeatherID(
        id: snapshot['id'],
        main: snapshot['main'],
        description: snapshot['description'],
        icon: snapshot['icon']);
  }
}

class Hour {
  final int? dt;
  final double? temp;
  final double? feels_like;
  final int? pressure;
  final int? humidity;
  final double? dew_point;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? wind_speed;
  // final double? wind_deg;
  final double? wind_gust;
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
        feels_like: snapshot['feels_like'],
        pressure: snapshot['pressure'],
        humidity: snapshot['humidity'],
        // dew_point: snapshot['dew_point'],
        // uvi: snapshot['uvi'],
        clouds: snapshot['clouds'],
        visibility: snapshot['visibility'],
        wind_speed: snapshot['wind_speed'],
        // wind_deg: snapshot['wind_deg'],
        wind_gust: snapshot['wind_gust'],
        weather: WeatherID.fromSnapshot(snapshot['weather'][0]),
        pop: snapshot['pop']);
  }
}

class Day {
  final int? dt;
  final int? sunrise; //
  final int? sunset; //
  final int? moonrise; //
  final int? moonset; //
  final double? moon_phase; //
  final Temp? temp; //
  final FeelsLike? feels_like; //
  final int? pressure;
  final int? humidity;
  final double? dew_point;
  final double? wind_speed;
  // final double? wind_deg;
  final double? wind_gust;
  final WeatherID? weather;
  final int? clouds;
  final double? pop; //
  final double? uvi; //

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
        wind_gust: snapshot['wind_gust'],
        weather: WeatherID.fromSnapshot(snapshot['weather'][0]),
        clouds: snapshot['clouds']
        //pop: snapshot['pop'],
        //uvi: snapshot['uvi']
        );
  }
}

class Temp {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromSnapshot(Map<String, dynamic> snapshot) {
    return Temp(
        day: snapshot['day'],
        min: snapshot['min'],
        max: snapshot['max'],
        night: snapshot['night'],
        eve: snapshot['eve'],
        morn: snapshot['morn']);
  }
}

class FeelsLike {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromSnapshot(Map<String, dynamic> snapshot) {
    return FeelsLike(
        day: snapshot['day'],
        night: snapshot['night'],
        eve: snapshot['eve'],
        morn: snapshot['morn']);
  }
}
