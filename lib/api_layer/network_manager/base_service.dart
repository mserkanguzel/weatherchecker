import 'package:dio/dio.dart';
import '../repository/weather_repository/weather_dio.dart';

abstract class BaseService {
  late Dio client;
  BaseService({required Dio? dio}) {
    if (dio != null) {
      client = dio;
    } else {
      final WeatherDio weatherDio = WeatherDio();
      client = weatherDio.dio;
    }
  }
}