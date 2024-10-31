import 'package:weather/domain/domain.dart';

abstract class PlacesRepository {
  const PlacesRepository();

  Future<List<Place>> getSuggestions(String request);
}
