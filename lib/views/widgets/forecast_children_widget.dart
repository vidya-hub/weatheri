import 'package:flutter/material.dart';

class ForecastChildrenWidget extends StatelessWidget {
  const ForecastChildrenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Tuesday",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Icon(
            Icons.sunny,
            color: Colors.black45,
          ),
        ),
        Expanded(
          child: Text(
            "28",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "30",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}
