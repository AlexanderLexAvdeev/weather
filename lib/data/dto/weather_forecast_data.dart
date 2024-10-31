import 'package:weather/data/data.dart';
import 'package:weather/utils/utils.dart';

final class WeatherForecastData {
  WeatherForecastData.fromJson(Map<String, dynamic> json)
      : list = Serialization.decodeList(
          decoder: WeatherConditionData.fromJson,
          json: json['list'],
        );

  final List<WeatherConditionData> list;
}
