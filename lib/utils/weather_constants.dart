import '../enums/weather_icon_enum.dart';

class WeatherConstants {
  static final WeatherConstants _instance = WeatherConstants._internal();

  factory WeatherConstants() {
    return _instance;
  }

  WeatherConstants._internal() {
    //initialization logic here
  }

  final Map<String, WeatherIcon> weatherIcons = {
    "01d": WeatherIcon.SUNNY,
    "01n": WeatherIcon.SUNNY,
    "02d": WeatherIcon.PARTIAL_CLOUDS,
    "02n": WeatherIcon.PARTIAL_CLOUDS,
    "03d": WeatherIcon.CLOUDY,
    "03n": WeatherIcon.CLOUDY,
    "04d": WeatherIcon.CLOUDY,
    "04n": WeatherIcon.CLOUDY,
    "09d": WeatherIcon.RAIN,
    "09n": WeatherIcon.RAIN,
    "10d": WeatherIcon.RAIN,
    "10n": WeatherIcon.RAIN,
    "11d": WeatherIcon.THUNDERSTORM_RAIN,
    "11n": WeatherIcon.THUNDERSTORM_RAIN,
    "13d": WeatherIcon.SNOW,
    "13n": WeatherIcon.SNOW,
    "50d": WeatherIcon.WINDY,
    "50n": WeatherIcon.WINDY,
  };

}
