import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

class WeatherForecastDayCubit extends Cubit<WeatherForecastDayState> {
  WeatherForecastDayCubit() : super(WeatherForecastDayState.init());

  final WeatherDayForecastRepository _repository =
      const OpenWeatherDayForecastRepository();

  Place? _place;

  Future<void> getForecast(Place place) async {
    _place = place;
    try {
      emit(WeatherForecastDayState.updating());
      final weatherForecast = await _repository.getForecast(place);
      emit(WeatherForecastDayState.result(weatherForecast));
    } on SocketException {
      emit(WeatherForecastDayState.noConnection());
    } on HttpException catch (exception) {
      emit(WeatherForecastDayState.httpException(exception.message));
    } catch (exception, stackTrace) {
      emit(WeatherForecastDayState.internalException(exception, stackTrace));
    }
  }

  Future<void> updateForecast() {
    if (_place == null) return Future.value();
    return getForecast(_place!);
  }
}
