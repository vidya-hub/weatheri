import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatheri/controllers/weather_cubit/weather_state.dart';
import 'package:weatheri/models/geo_location_model.dart';
import 'package:weatheri/models/weather_model.dart';
import 'package:weatheri/services/geo_location_service.dart';
import 'package:weatheri/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  Future<void> getLocation() async {
    emit(WeatherLoadingState());
    try {
      Position position = await _determinePosition();
      try {
        GeoLocation geoLocation = await GeoLocationService.getGeoLocation(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        log(geoLocation.toJson().toString());
        String displayName = geoLocation.displayName;
        print(displayName);
        WeatherData weatherData = await WeatherService.getWeather(
          displayName,
          position: position,
        );
        emit(
          WeatherLoadedState(
            position: position,
            address: displayName,
            weatherData: weatherData,
          ),
        );
      } catch (e) {
        emit(
          WeatherErrorState(error: e as Exception),
        );
      }
    } catch (e) {
      emit(
        WeatherErrorState(error: e as Exception),
      );
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> searchLocation({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      WeatherData weatherData = await WeatherService.getWeather(
        cityName,
      );
      WeatherLoadedState weatherLoadedState = WeatherLoadedState(
        position: null,
        address: cityName,
        weatherData: weatherData,
      );
      emit(weatherLoadedState);
    } catch (e) {
      emit(
        WeatherErrorState(error: e as Exception),
      );
    }
  }
}
