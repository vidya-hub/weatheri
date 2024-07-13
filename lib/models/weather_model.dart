class WeatherData {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Rain rain;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      coord: Coord.fromJson(json["coord"] ?? {}),
      weather: (json["weather"] as List<dynamic>?)
              ?.map((x) => Weather.fromJson(x))
              .toList() ??
          [],
      base: json["base"] ?? '',
      main: Main.fromJson(json["main"] ?? {}),
      visibility: json["visibility"] ?? 0,
      wind: Wind.fromJson(json["wind"] ?? {}),
      rain: json.containsKey("rain")
          ? Rain.fromJson(json["rain"] ?? {})
          : Rain(the1H: 0.0),
      clouds: Clouds.fromJson(json["clouds"] ?? {}),
      dt: json["dt"] ?? 0,
      sys: Sys.fromJson(json["sys"] ?? {}),
      timezone: json["timezone"] ?? 0,
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      cod: json["cod"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "coord": coord.toJson(),
      "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      "base": base,
      "main": main.toJson(),
      "visibility": visibility,
      "wind": wind.toJson(),
      "rain": rain.toJson(),
      "clouds": clouds.toJson(),
      "dt": dt,
      "sys": sys.toJson(),
      "timezone": timezone,
      "id": id,
      "name": name,
      "cod": cod,
    };
  }
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble() ?? 0.0,
        lat: json["lat"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json["temp"]?.toDouble() ?? 0.0) - 273.15,
        feelsLike: json["feels_like"]?.toDouble() ?? 0.0,
        tempMin: json["temp_min"]?.toDouble() ?? 0.0,
        tempMax: json["temp_max"]?.toDouble() ?? 0.0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        seaLevel: json["sea_level"] ?? 0,
        grndLevel: json["grnd_level"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class Rain {
  double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"] ?? '',
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  // Generate icon URL
  static String getIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] ?? 0,
        main: json["main"] ?? '',
        description: json["description"] ?? '',
        icon: getIconUrl(json["icon"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble() ?? 0.0,
        deg: json["deg"] ?? 0,
        gust: json["gust"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
