import 'package:flutter/material.dart';
import 'package:weatheri/views/widgets/forecast_children_widget.dart';

class ForeCastWidget extends StatelessWidget {
  const ForeCastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          6,
          (index) => const ForecastChildrenWidget(),
        ),
      ),
    );
  }
}
