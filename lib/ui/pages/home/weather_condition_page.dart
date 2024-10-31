import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class WeatherConditionPage extends StatelessWidget {
  const WeatherConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200.0),
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PlaceSearchBar(),
                CurrentWeather(),
                DayForecastWeather(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
