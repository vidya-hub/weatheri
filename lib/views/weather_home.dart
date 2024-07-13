import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/weather_cubit/weather_cubit.dart';
import 'package:weatheri/views/widgets/day_weather_widget.dart';
import 'package:weatheri/views/widgets/footer_widget.dart';
import 'package:weatheri/views/widgets/location_search_widget.dart';
import 'package:weatheri/views/widgets/timer_widget.dart';
import 'package:weatheri/views/widgets/weather_app_bar_widget.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  void initState() {
    context.read<WeatherCubit>().getLocation(); // Fetch initial location
    super.initState();
  }

  Widget get vSpacer {
    return const SizedBox(height: 10); // Vertical spacer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const WeatherAppBarWidget(), // Custom app bar widget
            LocationSearchWidget(), // Widget to search location
            vSpacer,
            const TimeWidget(), // Widget to display time
            vSpacer,
            const DayWeatherWidget(), // Widget to display weather
            const Spacer(), // Spacer to push footer to the bottom
            const FooterWidget() // Custom footer widget
          ],
        ),
      ),
    );
  }
}
