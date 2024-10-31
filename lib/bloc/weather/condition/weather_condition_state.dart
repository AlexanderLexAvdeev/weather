import 'package:weather/bloc/bloc.dart';
import 'package:weather/domain/domain.dart';

abstract class WeatherConditionState {
  factory WeatherConditionState.init() = InitState;

  factory WeatherConditionState.updating() = UpdatingState;

  factory WeatherConditionState.noConnection() = NoConnectionState;

  factory WeatherConditionState.httpException(String message) =
      HttpExceptionState;

  factory WeatherConditionState.internalException(
    Object exception, [
    StackTrace? stackTrace,
  ]) = InternalExceptionState;

  factory WeatherConditionState.result(WeatherCondition data) =
      ResultState<WeatherCondition>;
}
