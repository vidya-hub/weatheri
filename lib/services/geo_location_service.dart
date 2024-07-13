import 'package:http/http.dart';
import 'package:weatheri/models/geo_location_model.dart';
import 'package:weatheri/services/http_service.dart';

class GeoLocationService {
  static Future<GeoLocation> getGeoLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response =
          await HttpService.getGeoLocation(lat: latitude, lon: longitude);
      final responseBody = HttpService.parseResponse(response);
      return _handleGeoLocationResponse(response, responseBody);
    } catch (e) {
      throw Exception(
        "Error fetching Geo Location: ${e.toString()}",
      );
    }
  }

  static GeoLocation _handleGeoLocationResponse(
      Response? response, dynamic responseBody) {
    if (response?.statusCode == 200) {
      try {
        return GeoLocation.fromJson(responseBody.first);
      } catch (e) {
        throw Exception("Parsing error: ${e.toString()}");
      }
    } else {
      throw Exception("${responseBody['message']}");
    }
  }
}
