import 'package:dio/dio.dart';

class NetworkManager {
  final Dio dio;

  NetworkManager({required this.dio});

  Future<Response> httpRequest({
    HttpRequestTypes type = HttpRequestTypes.get,
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response;
      switch (type) {
        case HttpRequestTypes.get:
          response = await dio.get(dio.options.baseUrl, queryParameters: params);
          break;
        case HttpRequestTypes.post:
          response = await dio.post(dio.options.baseUrl, data: params);
          break;
      }
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("Server Error: ${e.response!.statusCode} - ${e.response!.statusMessage}");
      } else {
        throw Exception("Network Error: $e");
      }
    } catch (error) {
      throw Exception("Unknown Error: $error");
    }
  }
}

enum HttpRequestTypes {
  get,
  post,
}