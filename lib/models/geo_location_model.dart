class GeoLocation {
  String name;
  double lat;
  double lon;
  String country;
  String state;

  GeoLocation({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });
  String get displayName {
    List<String> parts = [];
    if (name.isNotEmpty) parts.add(name);
    if (state.isNotEmpty) parts.add(state);
    if (country.isNotEmpty) parts.add(country);
    return parts.join(', ');
  }

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        name: json["name"] ?? "",
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        country: json["country"] ?? "",
        state: json["state"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
      };
}
