import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment_2/models/forecast_model.dart';
import 'package:flutter_assesment_2/models/weather_model.dart';

class DioClient with ChangeNotifier {
  final Dio _dio = Dio();

  final currentUrl =
      'https://api.weatherapi.com/v1/current.json?key=d4c05a1d271b4c308d660435232106&q=34.02139053920694,35.647088393446026';
  final forecastUrl =
      'https://api.weatherapi.com/v1/forecast.json?key=d4c05a1d271b4c308d660435232106&q=34.02139053920694,35.647088393446026&days=14';

  Future<WeatherModel> getWeather() async {
    Response response = await _dio.get('$currentUrl');

    if (kDebugMode) {
      print('List Info: $response');
    }

    dynamic jsonData = response.data;

    WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

    return weatherModel;
  }

  Future<ForeCastModel> getWeatherList() async {
    Response response = await _dio.get('$forecastUrl');

    if (kDebugMode) {
      print('List Info: $response');
    }

    dynamic jsonData = response.data;

    ForeCastModel foreCastModel = ForeCastModel.fromJson(jsonData);

    return foreCastModel;
  }
}
