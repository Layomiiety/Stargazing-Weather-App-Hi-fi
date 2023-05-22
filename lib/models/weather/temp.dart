class Temp {
  int? day;
  int? min;
  int? max;
  int? night;
  int? eve;
  int? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: (json['day'] as num?)?.toInt(),
        min: (json['min'] as num?)?.toInt(),
        max: (json['max'] as num?)?.toInt(),
        night: (json['night'] as num?)?.toInt(),
        eve: (json['eve'] as num?)?.toInt(),
        morn: (json['morn'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
      };
}
