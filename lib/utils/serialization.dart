import 'dart:convert';

final class Serialization {
  const Serialization._();

  static List<T> decodeList<T>({
    required T Function(Map<String, dynamic> json) decoder,
    required dynamic json,
  }) {
    if (json == null || json.isEmpty) {
      return [];
    }

    final List<dynamic> jsonArray = json is String ? jsonDecode(json) : json;

    return jsonArray
        .map<T>(
          (jsonObject) => decoder.call(jsonObject),
        )
        .toList();
  }

  static T decodeObject<T>({
    required T Function(Map<String, dynamic> json) decoder,
    required dynamic jsonString,
  }) =>
      decoder.call(jsonDecode(jsonString));
}
