import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 10),
      alignment: Alignment.bottomLeft,
      child: Text(
        "Weatheri",
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 20,
            ),
      ),
    );
  }
}
