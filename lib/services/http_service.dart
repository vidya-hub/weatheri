import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final HttpService _instance = HttpService._internal();
  static const String _weatherBaseUrl =
      "https://api.openweathermap.org/data/2.5/weather";
  static const String _geoLocationBaseUrl =
      "https://api.openweathermap.org/geo/1.0/reverse";

  static String _apiKey = "";

  HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  static init() async {
    await dotenv.load(fileName: ".env");
    _apiKey = dotenv.env['OPEN_WEATHER_API_KEY']!;
  }

  static Future<http.Response?> getWeatherFromCityName({
    required String cityName,
  }) async {
    String url = "$_weatherBaseUrl?q=$cityName&appid=$_apiKey";
    try {
      http.Response response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<http.Response?> getWeatherFromLatLong({
    required double lat,
    required double lon,
  }) async {
    String url = "$_weatherBaseUrl?lat=$lat&lon=$lon&appid=$_apiKey";
    try {
      http.Response response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<http.Response?> getGeoLocation({
    required double lat,
    required double lon,
  }) async {
    String url = "$_geoLocationBaseUrl?lat=$lat&lon=$lon&appid=$_apiKey";
    try {
      http.Response response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static dynamic parseResponse(http.Response? response) {
    try {
      return jsonDecode(response?.body ?? "");
    } catch (e) {
      throw Exception("Error parsing response");
    }
  }
}
