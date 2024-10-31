extension KelvinExtension on double {
  int toCelsius() => (this - 273.15).round();

  int toFahrenheit() => (toCelsius() * 1.8 + 32).round();
}
