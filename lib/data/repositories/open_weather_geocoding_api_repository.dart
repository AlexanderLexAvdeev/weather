import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

class OpenWeatherGeocodingApiRepository extends PlacesRepository {
  const OpenWeatherGeocodingApiRepository();

  final PlacesService _service = const OpenWeatherGeocodingApiService();

  @override
  Future<List<Place>> getSuggestions(String request) async {
    final placesData = await _service.fetchSuggestions(request);
    return placesData.map((data) => data.toEntity()).toList();
  }
}
