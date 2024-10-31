import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app/app.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/ui/ui.dart';

void main() async {
  if (openWeatherMapApiKey.isEmpty) {
    throw AssertionError('Open Weather Map API key is not set');
  }
  await AppSettings.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PlacesCubit>(
          create: (BuildContext context) => PlacesCubit(),
        ),
        BlocProvider<WeatherConditionCubit>(
          create: (BuildContext context) => WeatherConditionCubit(),
        ),
        BlocProvider<WeatherForecastDayCubit>(
          create: (BuildContext context) => WeatherForecastDayCubit(),
        ),
      ],
      child: const App(),
    ),
  );
}
