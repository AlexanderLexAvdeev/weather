final class WeatherCondition {
  const WeatherCondition({
    required this.placeName,
    required this.dateTime,
    required this.temperatureKelvin,
    required this.feelsTemperatureKelvin,
    required this.iconName,
    required this.description,
  });

  final String placeName;
  final DateTime dateTime;
  final double temperatureKelvin;
  final double feelsTemperatureKelvin;
  final String iconName;
  final String description;
}
