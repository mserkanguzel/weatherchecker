import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherchecker/api_layer/network_manager/base_service.dart';
import 'package:weatherchecker/api_layer/network_manager/network_manager.dart';
import 'package:weatherchecker/models/weather_model.dart';
import 'package:weatherchecker/utils/app_constant.dart';


abstract interface class IWeatherRepository {
  Future<OpenWeatherMapDTO> fetchWeather({required String lat, required String lon});
}

class WeatherRepository extends BaseService implements IWeatherRepository {
  late NetworkManager _networkManager;
  WeatherRepository({super.dio}) {
    _networkManager = NetworkManager(dio: client);
  }
  @override
  Future<OpenWeatherMapDTO> fetchWeather({required String lat, required String lon}) async {
    OpenWeatherMapDTO openWeatherMapDTO;
    try {
      Response response = await _networkManager.httpRequest(
          params: {
            "lat" : lat,
            "lon" : lon,
            "appid" : AppConstant.weatherAPIKey
          });
     OpenWeatherMapModel openWeatherMapModel = OpenWeatherMapModel.fromJson(response.data);
     openWeatherMapDTO = OpenWeatherMapDTO(name:openWeatherMapModel.name,
          temp: openWeatherMapModel.main?.temp,
          description: openWeatherMapModel.weather?.first.description,
          icon: openWeatherMapModel.weather?.first.icon);
    } catch (error) {
      debugPrint(error.toString());
      return await Future.error("Could not get weather forecast");
    }
    return openWeatherMapDTO;
  }
}