import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weatheri/models/weather_model.dart';
import 'package:weatheri/services/http_service.dart';

class WeatherService {
  /// Fetches weather data for a given city name.
  ///
  /// Throws [Exception] on network errors or if city is not found.
  static Future<WeatherData> getWeather(
    String cityName, {
    Position? position,
  }) async {
    try {
      final response =
          await HttpService.getWeatherFromCityName(cityName: cityName);
      final responseBody = HttpService.parseResponse(response);
      return _handleWeatherResponse(response, responseBody, position);
    } catch (e) {
      throw Exception("Error fetching weather: ${e.toString()}");
    }
  }

  /// Handles the weather API response.
  ///
  /// Parses the response and determines whether to fetch weather by position
  /// if city is not found and position is provided.
  static Future<WeatherData> _handleWeatherResponse(
    Response? response,
    dynamic responseBody,
    Position? position,
  ) async {
    if (response?.statusCode == 200) {
      try {
        return WeatherData.fromJson(responseBody);
      } catch (e) {
        throw Exception("Parsing error: ${e.toString()}");
      }
    } else {
      if (responseBody['message'] == "city not found" && position != null) {
        // Retrieve the data when local lat lang available
        return _fetchWeatherByPosition(position);
      } else {
        throw Exception("${responseBody['message']}");
      }
    }
  }

  /// Fetches weather data based on geographical position (latitude and longitude).
  ///
  /// Throws [Exception] if there's an error in fetching or parsing the response.
  static Future<WeatherData> _fetchWeatherByPosition(Position position) async {
    final latLongResponse = await HttpService.getWeatherFromLatLong(
      lat: position.latitude,
      lon: position.longitude,
    );
    final latLongResponseBody = HttpService.parseResponse(latLongResponse);
    if (latLongResponse != null && latLongResponse.statusCode == 200) {
      try {
        return WeatherData.fromJson(latLongResponseBody);
      } catch (e) {
        throw Exception("Parsing error: ${e.toString()}");
      }
    } else {
      throw Exception("${latLongResponseBody['message']}");
    }
  }
}
