import 'package:weather/domain/domain.dart';

final class PlaceData {
  PlaceData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        localNames = json['local_names'],
        latitude = json['lat'],
        longitude = json['lon'],
        country = json['country'];

  final String? name;
  final Map<String, dynamic>? localNames;
  final double? latitude;
  final double? longitude;
  final String? country;

  Place toEntity() => Place(
        name: name ?? '',
        localNames: localNames?.cast<String, String>() ?? {},
        latitude: latitude ?? 0.0,
        longitude: longitude ?? 0.0,
        country: country ?? '',
      );
}
