import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheri/controllers/theme_cubit/theme_cubit.dart';

class ThemeIconWidget extends StatelessWidget {
  const ThemeIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return IconButton(
            iconSize: 25,
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(state != ThemeState.light
                ? Icons.wb_sunny
                : Icons.dark_mode_sharp),
          );
        },
      ),
    );
  }
}
