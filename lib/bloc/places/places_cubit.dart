import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(PlacesState.init());

  final PlacesRepository _repository =
      const OpenWeatherGeocodingApiRepository();

  Completer<void>? _completer;
  Timer? _debounce;

  Future<void> getSuggestions(String request) async {
    if (request.isEmpty) {
      return;
    }

    _completer = Completer();

    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () => _completer?.complete(_getSuggestions(request)),
    );

    return _completer?.future;
  }

  Future<void> _getSuggestions(String request) async {
    try {
      final placeEntities = await _repository.getSuggestions(request);
      emit(PlacesState.result(placeEntities));
    } on SocketException {
      emit(PlacesState.noConnection());
    } on HttpException catch (exception) {
      emit(PlacesState.httpException(exception.message));
    } catch (exception, stackTrace) {
      emit(PlacesState.internalException(exception, stackTrace));
    }
  }
}
