import 'dart:io';

import 'package:http/http.dart' as client;
import 'package:weather/app/app.dart';
import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';
import 'package:weather/utils/utils.dart';

class OpenWeatherDayForecastService extends WeatherDayForecastService {
  const OpenWeatherDayForecastService();

  static const _forecastTimestampsLimit = '8';

  @override
  Future<List<WeatherConditionData>> fetchForecast(Place place) async {
    final response = await client.get(
      Uri.https(
        apiBaseUrl,
        '/data/2.5/forecast',
        {
          'lat': place.latitude.toString(),
          'lon': place.longitude.toString(),
          'cnt': _forecastTimestampsLimit,
          'lang': appSettings.language,
          'appid': openWeatherMapApiKey,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    final weatherForecastData = Serialization.decodeObject(
      decoder: WeatherForecastData.fromJson,
      jsonString: response.body,
    );

    return weatherForecastData.list;
  }
}
