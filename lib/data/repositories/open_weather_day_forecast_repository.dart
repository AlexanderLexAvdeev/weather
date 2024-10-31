import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

class OpenWeatherDayForecastRepository extends WeatherDayForecastRepository {
  const OpenWeatherDayForecastRepository();

  final WeatherDayForecastService _service =
      const OpenWeatherDayForecastService();

  @override
  Future<List<WeatherCondition>> getForecast(Place place) async {
    final weatherForecast = await _service.fetchForecast(place);
    return weatherForecast.map((data) => data.toEntity()).toList();
  }
}
