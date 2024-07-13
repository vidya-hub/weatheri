import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/theme_cubit/theme_cubit.dart';
import 'package:weatheri/controllers/weather_cubit/weather_cubit.dart';
import 'package:weatheri/controllers/weather_cubit/weather_state.dart';
import 'package:weatheri/utils/extensions/date_time_extensions.dart';
import 'package:weatheri/utils/extensions/string_extension.dart';

class DayWeatherWidget extends StatelessWidget {
  const DayWeatherWidget({super.key});

  // Get the formatted day using custom DateTime extension
  String get formattedDay {
    return DateTime.now().toLocal().formattedDay;
  }

  // Determine the background color based on the time of the day using custom extension
  Color get getDayColor {
    return DateTime.now().getColorForTime;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      flex: 15,
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: getDayColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display weather details if WeatherLoadedState
                if (state is WeatherLoadedState) ...[
                  const Spacer(
                    flex: 2,
                  ),
                  // Display formatted day
                  Text(
                    formattedDay,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Display current temperature
                  Text(
                    "${(state.weatherData.main.temp).toInt()}°c",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Display weather icon based on current theme
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return CircleAvatar(
                        radius: 30,
                        backgroundColor: themeState == ThemeState.dark
                            ? Colors.blueGrey.shade900
                            : Colors.blueGrey.shade300,
                        child: Image.network(
                          state.weatherData.weather.first.icon,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Display weather description
                  Text(
                    state.weatherData.weather.first.description.toCamelCase,
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ]
                // Display loading indicator if WeatherLoadingState
                else if (state is WeatherLoadingState) ...[
                  const CircularProgressIndicator(),
                ]
                // Display error message if WeatherErrorState
                else if (state is WeatherErrorState) ...[
                  SizedBox(
                    width: 300,
                    child: Text(
                      "Error: ${state.message}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}
