import 'package:flutter/material.dart';
import 'package:weatheri/views/widgets/city_widget.dart';
import 'package:weatheri/views/widgets/refresh_icon_widget.dart';
import 'package:weatheri/views/widgets/theme_icon_widget.dart';

class WeatherAppBarWidget extends StatelessWidget {
  const WeatherAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 3, // Expanded widget to take up 3 flex units
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThemeIconWidget(), // Widget to toggle theme
            CityWidget(), // Widget to display the current city
            RefreshIconWidget(), // Widget to refresh the weather data
          ],
        ),
      ),
    );
  }
}
