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
