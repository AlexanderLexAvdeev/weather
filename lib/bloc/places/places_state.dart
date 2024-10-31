import 'package:weather/bloc/bloc.dart';
import 'package:weather/domain/domain.dart';

abstract class PlacesState {
  factory PlacesState.init() = InitState;

  factory PlacesState.updating() = UpdatingState;

  factory PlacesState.noConnection() = NoConnectionState;

  factory PlacesState.httpException(String message) = HttpExceptionState;

  factory PlacesState.internalException(
    Object exception, [
    StackTrace? stackTrace,
  ]) = InternalExceptionState;

  factory PlacesState.result(List<Place> data) = ResultState<List<Place>>;
}
