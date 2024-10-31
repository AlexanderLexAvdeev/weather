import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

class WeatherConditionCubit extends Cubit<WeatherConditionState> {
  WeatherConditionCubit() : super(WeatherConditionState.init());

  final WeatherConditionRepository _repository =
      const OpenWeatherCurrentDataRepository();

  Place? _place;

  Future<void> getCurrentWeather(Place place) async {
    _place = place;
    try {
      emit(WeatherConditionState.updating());
      final weatherCondition = await _repository.getCurrentWeather(place);
      emit(WeatherConditionState.result(weatherCondition));
    } on SocketException {
      emit(WeatherConditionState.noConnection());
    } on HttpException catch (exception) {
      emit(WeatherConditionState.httpException(exception.message));
    } catch (exception, stackTrace) {
      emit(WeatherConditionState.internalException(exception, stackTrace));
    }
  }

  Future<void> updateCurrentWeather() {
    if (_place == null) return Future.value();
    return getCurrentWeather(_place!);
  }
}
