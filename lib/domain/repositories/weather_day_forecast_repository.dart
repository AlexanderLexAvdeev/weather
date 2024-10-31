import 'package:weather/domain/domain.dart';

abstract class WeatherDayForecastRepository {
  const WeatherDayForecastRepository();

  Future<List<WeatherCondition>> getForecast(Place place);
}
