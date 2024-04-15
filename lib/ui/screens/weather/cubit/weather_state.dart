part of 'weather_cubit.dart';

sealed class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
 final OpenWeatherMapDTO data;
  WeatherLoadedState({required this.data});
}

class WeatherErrorState extends WeatherState {
 final String errorMessage;
 WeatherErrorState({required this.errorMessage});
}

