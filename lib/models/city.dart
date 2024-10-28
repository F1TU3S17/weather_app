class City {
  final String name;
  final String country;
  final double latitude;
  final double longitude;
  final Current currentData;

  City({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.currentData,
  });


  factory City.fromJson(Map<String, dynamic> data) {
    final Map<String, dynamic> dataLocation = data["location"];
    final Map<String, dynamic> dataCurrent = data["current"];

    return City(
      name: dataLocation['name'],
      country: dataLocation['country'],
      latitude: dataLocation['lat'],
      longitude: dataLocation['lon'],
      currentData: Current.fromJson(dataCurrent),
    );
  }

}

class Current {
  final double temperatureC;
  final int isDay;
  final Condition condition;

  Current({
    required this.temperatureC,
    required this.isDay,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> data) {
    final Map<String, dynamic> dataCondition = data["condition"];

    return Current(
      temperatureC: data['temp_c'],
      isDay: data['is_day'],
      condition: Condition.fromJson(dataCondition),
    );
  }
}

class Condition {
  final String? text;
  final String? icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> data) {
    return Condition(
      text: data['text'],
      icon: data['icon'],
    );
  }
}