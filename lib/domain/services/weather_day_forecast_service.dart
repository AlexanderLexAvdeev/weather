import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

abstract class WeatherDayForecastService {
  const WeatherDayForecastService();

  Future<List<WeatherConditionData>> fetchForecast(Place place);
}
