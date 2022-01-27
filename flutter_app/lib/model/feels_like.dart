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
