import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/weather_cubit/weather_cubit.dart';
import 'package:weatheri/controllers/weather_cubit/weather_state.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Tooltip(
            message: state.displayName,
            child: Text(
              state.displayName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
