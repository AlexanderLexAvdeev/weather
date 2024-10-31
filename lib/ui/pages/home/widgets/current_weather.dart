import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/domain/domain.dart';
import 'package:weather/extensions/extensions.dart';
import 'package:weather/utils/utils.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  final _whiteColoredTextStyle = const TextStyle(color: Colors.white);

  void _update(BuildContext context) {
    context.read<WeatherConditionCubit>().updateCurrentWeather();
    context.read<WeatherForecastDayCubit>().updateForecast();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherConditionCubit, WeatherConditionState>(
      builder: (context, state) {
        return switch (state) {
          UpdatingState _ => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ResultState<WeatherCondition> result => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      result.data.placeName,
                      style: _whiteColoredTextStyle.copyWith(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            '${context.strings.updated} '
                            '${DateTime.now().formatElapsedTimeFrom(
                              then: result.data.dateTime,
                              context: context,
                            )}',
                            style: _whiteColoredTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          color: Colors.white,
                          onPressed: () => _update(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${result.data.temperatureKelvin.toCelsius()}',
                          style: _whiteColoredTextStyle.copyWith(
                            fontSize: 96.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            context.strings.degreesCelsius,
                            style: _whiteColoredTextStyle.copyWith(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: url.largeWeatherIcon(result.data.iconName),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.strings.feelsLike} '
                      '${context.strings.degrees(
                        result.data.feelsTemperatureKelvin.toCelsius(),
                      )}',
                      style: _whiteColoredTextStyle.copyWith(
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      result.data.description,
                      style: _whiteColoredTextStyle.copyWith(
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
