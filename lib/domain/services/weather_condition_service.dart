import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

abstract class WeatherConditionService {
  const WeatherConditionService();

  Future<WeatherConditionData> fetchCurrentWeather(Place place);
}
