import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/weather_cubit/weather_cubit.dart';

class RefreshIconWidget extends StatelessWidget {
  const RefreshIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        iconSize: 25,
        onPressed: () async {
          await context.read<WeatherCubit>().getLocation();
        },
        tooltip: "Refresh",
        icon: const Icon(
          Icons.gps_fixed_rounded,
        ),
      ),
    );
  }
}
