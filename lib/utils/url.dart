import 'package:weather/app/app.dart';

const url = _Url();

final class _Url {
  const _Url();

  String largeWeatherIcon(String iconName) =>
      'https://$iconBaseUrl/img/wn/$iconName@4x.png';

  String smallWeatherIcon(String iconName) =>
      'https://$iconBaseUrl/img/wn/$iconName@2x.png';
}
