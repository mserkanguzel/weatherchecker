import 'package:weatherchecker/models/weather_model.dart';
import 'package:weatherchecker/utils/weather_constants.dart';
import '../enums/weather_icon_enum.dart';
import '../utils/image_constants.dart';

extension WeatherExtension on OpenWeatherMapDTO {
  String get weatherIcon {
    final ImageConstants imageConstants = ImageConstants();
    final WeatherConstants weatherConstants = WeatherConstants();
    if (icon == null || !weatherConstants.weatherIcons.containsKey(icon)) {
      return imageConstants.weatherPath(WeatherIcon.SUNNY);
    }
    WeatherIcon weatherIcon = weatherConstants.weatherIcons[icon]!;
    return imageConstants.weatherPath(weatherIcon);
  }
}