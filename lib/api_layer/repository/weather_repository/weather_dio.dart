import 'package:dio/dio.dart';

import '../../../utils/app_constant.dart';

class WeatherDio {
  static final WeatherDio _instance = WeatherDio._internal();

  factory WeatherDio() {
    return _instance;
  }

  final Dio _dio = Dio();
  Dio get dio => _dio;
  WeatherDio._internal() {
    //initialization logic here
    _dio.options = BaseOptions(baseUrl: AppConstant.weatherBaseUrl);
  }
}