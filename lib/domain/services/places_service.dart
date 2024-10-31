import 'package:weather/data/data.dart';

abstract class PlacesService {
  const PlacesService();

  Future<List<PlaceData>> fetchSuggestions(String request);
}
