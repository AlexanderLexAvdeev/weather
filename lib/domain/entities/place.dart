final class Place {
  const Place({
    required this.name,
    required this.localNames,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  final String name;
  final Map<String, String> localNames;
  final double latitude;
  final double longitude;
  final String country;

  String localName(String locale) => localNames[locale] ?? name;
}
