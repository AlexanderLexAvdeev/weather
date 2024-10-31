import 'dart:io';

import 'package:http/http.dart' as client;
import 'package:weather/app/app.dart';
import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';
import 'package:weather/utils/utils.dart';

class OpenWeatherCurrentDataService extends WeatherConditionService {
  const OpenWeatherCurrentDataService();

  @override
  Future<WeatherConditionData> fetchCurrentWeather(Place place) async {
    final response = await client.get(
      Uri.https(
        apiBaseUrl,
        '/data/2.5/weather',
        {
          'lat': place.latitude.toString(),
          'lon': place.longitude.toString(),
          'lang': appSettings.language,
          'appid': openWeatherMapApiKey,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    final weatherConditionData = Serialization.decodeObject(
      decoder: WeatherConditionData.fromJson,
      jsonString: response.body,
    );

    return weatherConditionData;
  }
}
