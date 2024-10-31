import 'package:weather/bloc/bloc.dart';

class InitState
    implements PlacesState, WeatherConditionState, WeatherForecastDayState {}

class UpdatingState
    implements PlacesState, WeatherConditionState, WeatherForecastDayState {}

class NoConnectionState
    implements PlacesState, WeatherConditionState, WeatherForecastDayState {}

class HttpExceptionState
    implements PlacesState, WeatherConditionState, WeatherForecastDayState {
  HttpExceptionState(this.message);

  final String message;
}

class InternalExceptionState
    implements PlacesState, WeatherConditionState, WeatherForecastDayState {
  InternalExceptionState(this.exception, [this.stackTrace]);

  final Object exception;
  final StackTrace? stackTrace;
}

class ResultState<T>
    implements PlacesState, WeatherConditionState, WeatherForecastDayState {
  const ResultState(this.data);

  final T data;
}
