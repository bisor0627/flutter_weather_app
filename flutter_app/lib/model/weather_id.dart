class WeatherID {
  final num? id;
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
