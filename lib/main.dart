import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/theme_cubit/theme_cubit.dart';
import 'package:weatheri/controllers/weather_cubit/weather_cubit.dart';
import 'package:weatheri/services/http_service.dart';
import 'package:weatheri/views/weather_home.dart';

Future<void> main() async {
  await HttpService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weatheri',
            theme: themeCubit.themeData,
            home: const WeatherHomePage(),
          );
        },
      ),
    );
  }
}
