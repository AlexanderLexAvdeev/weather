import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/domain/domain.dart';
import 'package:weather/extensions/extensions.dart';
import 'package:weather/utils/utils.dart';

class DayForecastWeather extends StatelessWidget {
  const DayForecastWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDayCubit, WeatherForecastDayState>(
      builder: (context, state) {
        return switch (state) {
          ResultState<List<WeatherCondition>> result => ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.0),
                child: ColoredBox(
                  color: Colors.lightBlueAccent,
                  child: CarouselView(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                    backgroundColor: Colors.white,
                    itemExtent: 250.0,
                    shrinkExtent: 200.0,
                    children: result.data.map(
                      (condition) {
                        return _WeatherConditionItem(condition);
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

class _WeatherConditionItem extends StatelessWidget {
  const _WeatherConditionItem(this.condition);

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${condition.temperatureKelvin.toCelsius()}',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.strings.degreesCelsius,
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
          CachedNetworkImage(
            imageUrl: url.smallWeatherIcon(condition.iconName),
          ),
          Text(
            condition.description,
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            DateFormat('HH:mm').format(condition.dateTime),
          ),
        ],
      ),
    );
  }
}
