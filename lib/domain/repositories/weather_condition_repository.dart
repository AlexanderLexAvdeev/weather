import 'package:weather/domain/domain.dart';

abstract class WeatherConditionRepository {
  const WeatherConditionRepository();

  Future<WeatherCondition> getCurrentWeather(Place place);
}
