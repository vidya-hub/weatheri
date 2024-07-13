import 'package:geolocator/geolocator.dart';
import 'package:weatheri/models/weather_model.dart';

sealed class WeatherState {
  String get displayName {
    if (this is WeatherLoadingState) {
      return "Loading...";
    } else if (this is WeatherLoadedState) {
      return (this as WeatherLoadedState).address;
    } else if (this is WeatherErrorState) {
      return "Error";
    }
    return "Loading....";
  }
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherErrorState extends WeatherState {
  Exception error;
  WeatherErrorState({required this.error});
  String get message {
    return error.toString().split(": ").last;
  }
}

final class WeatherLoadedState extends WeatherState {
  Position? position;
  String address;
  WeatherData weatherData;
  WeatherLoadedState({
    this.position,
    required this.address,
    required this.weatherData,
  });
  WeatherLoadedState copyWith({
    Position? position,
    String? address,
    WeatherData? weatherData,
  }) {
    return WeatherLoadedState(
      position: position ?? this.position,
      address: address ?? this.address,
      weatherData: weatherData ?? this.weatherData,
    );
  }
}
