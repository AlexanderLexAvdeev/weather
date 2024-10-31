import 'package:weather/domain/domain.dart';

final class WeatherConditionData {
  WeatherConditionData.fromJson(Map<String, dynamic> json)
      : placeName = json['name'],
        timestamp = json['dt'],
        temperatureKelvin = json['main']['temp'],
        feelsTemperatureKelvin = json['main']['feels_like'],
        iconName = json['weather'][0]['icon'],
        description = json['weather'][0]['description'];

  final String? placeName;
  final int? timestamp;
  final double? temperatureKelvin;
  final double? feelsTemperatureKelvin;
  final String? iconName;
  final String? description;

  WeatherCondition toEntity() => WeatherCondition(
        placeName: placeName ?? '',
        dateTime: DateTime.fromMillisecondsSinceEpoch((timestamp ?? 0) * 1000),
        temperatureKelvin: temperatureKelvin ?? 0.0,
        feelsTemperatureKelvin: feelsTemperatureKelvin ?? 0.0,
        iconName: iconName ?? '',
        description: description ?? '',
      );
}
