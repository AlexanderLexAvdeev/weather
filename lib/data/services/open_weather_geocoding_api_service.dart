import 'dart:io';

import 'package:http/http.dart' as client;
import 'package:weather/app/app.dart';
import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';
import 'package:weather/utils/utils.dart';

class OpenWeatherGeocodingApiService extends PlacesService {
  const OpenWeatherGeocodingApiService();

  static const _placeSuggestionLimit = '5';

  @override
  Future<List<PlaceData>> fetchSuggestions(String request) async {
    final response = await client.get(
      Uri.https(
        apiBaseUrl,
        '/geo/1.0/direct',
        {
          'q': request,
          'limit': _placeSuggestionLimit,
          'appid': openWeatherMapApiKey,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    final placesData = Serialization.decodeList(
      decoder: PlaceData.fromJson,
      json: response.body,
    );

    return placesData;
  }
}
