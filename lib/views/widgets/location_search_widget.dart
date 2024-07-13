import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/weather_cubit/weather_cubit.dart';
import 'package:weatheri/controllers/weather_cubit/weather_state.dart';

class LocationSearchWidget extends StatelessWidget {
  LocationSearchWidget({
    super.key,
  });
  final TextEditingController controller = TextEditingController();
  void searchCity({
    required BuildContext context,
  }) {
    if (controller.text.isEmpty) return;
    FocusScope.of(context).unfocus();
    context.read<WeatherCubit>().searchLocation(
          cityName: controller.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return TextField(
              enabled:
                  state is WeatherLoadedState || state is WeatherErrorState,
              controller: controller,
              onSubmitted: (value) {
                searchCity(context: context);
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Search',
                focusColor: Colors.black,
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchCity(context: context);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            );
          },
          listener: (BuildContext context, WeatherState state) {
            controller.clear();
          },
        ),
      ),
    );
  }
}
