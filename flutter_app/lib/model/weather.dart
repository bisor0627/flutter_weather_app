import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loca;

class Address {
  final double? lat;
  final double? lon;
  Address({this.lat, this.lon});
  factory Address.fromLocation(Location location) {
    return Address(lat: location.latitude, lon: location.longitude);
  }
  factory Address.fromLocationData(loca.LocationData? locationData) {
    return Address(lat: locationData!.latitude, lon: locationData.longitude);
  }
}

// List<Weather> productsResponseFromJson(String str) =>
//     List<Weather>.from(json.decode(str).map((x) {
//       print(x);
//       Weather.fromSnapshot(x);
//     }));

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

class Current {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final num? temp;
  final num? feels_like;
  final int? pressure;
  final int? humidity;
  final num? dew_point;
  final num? uvi;
  final int? clouds;
  final int? visibility;
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

class Temp {
  final num? day;
  final num? min;
  final num? max;
  final num? night;
  final num? eve;
  final num? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromSnapshot(Map<String, dynamic> snapshot) {
    return Temp(
      day: snapshot['day'] ?? 0.1,
      // min: snapshot['min'],
      // max: snapshot['max'],
      // night: snapshot['night'],
      // eve: snapshot['eve'],
      // morn: snapshot['morn']
    );
  }
}

class FeelsLike {
  final num? day;
  final num? night;
  final num? eve;
  final num? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromSnapshot(Map<String, dynamic> snapshot) {
    return FeelsLike(
        day: snapshot['day'],
        night: snapshot['night'],
        eve: snapshot['eve'],
        morn: snapshot['morn']);
  }
}
