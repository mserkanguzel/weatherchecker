import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherchecker/api_layer/repository/weather_repository/weather_repository.dart';

import '../../../../models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit({required this.weatherRepository}) : super(WeatherLoadingState());

  Future<void> fetchWeather() async {
    try {
      OpenWeatherMapDTO data = await weatherRepository.fetchWeather(lat: "37.000000", lon: "35.321335");
      emit(WeatherLoadedState(data: data));
    } catch (e) {
      emit(WeatherErrorState(errorMessage: e.toString()));
    }
  }
}

