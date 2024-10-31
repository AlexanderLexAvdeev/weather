import 'package:weather/bloc/bloc.dart';
import 'package:weather/domain/domain.dart';

abstract class WeatherForecastDayState {
  factory WeatherForecastDayState.init() = InitState;

  factory WeatherForecastDayState.updating() = UpdatingState;

  factory WeatherForecastDayState.noConnection() = NoConnectionState;

  factory WeatherForecastDayState.httpException(String message) =
      HttpExceptionState;

  factory WeatherForecastDayState.internalException(
    Object exception, [
    StackTrace? stackTrace,
  ]) = InternalExceptionState;

  factory WeatherForecastDayState.result(List<WeatherCondition> data) =
      ResultState<List<WeatherCondition>>;
}
