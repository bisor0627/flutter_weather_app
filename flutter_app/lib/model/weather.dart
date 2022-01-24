class Weather {
  late double lat;
  late double lon;
  late String timezone;
  late int timezone_offset;
  late Map current;

  Weather.fromMap(Map<String, dynamic> res) {
    lat = res['lat'];
    lon = res['lon'];
    timezone = res['timezone'];
    timezone_offset = res['timezone_offset'];
    current = res['current'];
  }

  Map<String, dynamic> toMap() {
    return {
      "lat": lat,
      "lon": lon,
      "timezone": timezone,
      "timezone_offset": timezone_offset,
      "current": current
    };
  }
}

class Current {
  late int dt;
  late int sunrise;
  late int sunset;
  late double temp;
  late double feels_like;
  late int pressure;
  late double humidity;
  late double dew_point;
  late double uvi;
  late int clouds;
  late int visibility;
  late double wind_speed;
  late int wind_deg;
  late WeatherID weathe;
}

class WeatherID {
  late int id;
  late String main;
  late String description;
  late String icon;
}

class Hourly {
  late int dt;
  late double temp;
  late double feels_like;
  late int pressure;
  late double humidity;
  late double dew_point;
  late double uvi;
  late int clouds;
  late int visibility;
  late double wind_speed;
  late int wind_deg;
  late double wind_gust;
  late WeatherID weathe;
  late int pop;
}

class Daily {
  late int dt;
  late int sunrise;
  late int sunset;
  late int moonrise;
  late int moonset;
  late double moon_phase;
}
