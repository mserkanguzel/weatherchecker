class OpenWeatherMapDTO {
  String? description;
  String? icon;
  String? name;
  double? temp;

  OpenWeatherMapDTO({
    this.description,
    this.icon,
    this.name,
    this.temp
  });
}

class OpenWeatherMapModel {
  List<WeatherModel>? weather;
  WeatherMainModel? main;
  String? name;
  OpenWeatherMapModel({this.weather, this.main, this.name,});

  OpenWeatherMapModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null && json["weather"] is List) {
      weather = (json["weather"] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList();
    }
    main = json['main'] != null ? WeatherMainModel.fromJson(json['main']) : null;
    name = json['name'];
  }
}


class WeatherMainModel {
  double? temp;
  WeatherMainModel({this.temp});

  WeatherMainModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }
}

class WeatherModel {
  int? id;
  String? main;
  String? description;
  String? icon;
  WeatherModel({this.id, this.main, this.description, this.icon});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}