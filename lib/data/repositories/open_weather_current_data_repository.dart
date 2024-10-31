import 'package:weather/data/data.dart';
import 'package:weather/domain/domain.dart';

class OpenWeatherCurrentDataRepository extends WeatherConditionRepository {
  const OpenWeatherCurrentDataRepository();

  final WeatherConditionService _service =
      const OpenWeatherCurrentDataService();

  @override
  Future<WeatherCondition> getCurrentWeather(Place place) async {
    final currentWeatherData = await _service.fetchCurrentWeather(place);
    return currentWeatherData.toEntity();
  }
}
