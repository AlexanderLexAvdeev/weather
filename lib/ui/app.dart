import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather/extensions/extensions.dart';
import 'package:weather/ui/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationsDelegates,
      supportedLocales: context.supportedLocales,
      scrollBehavior: const ScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          surface: Colors.blueAccent,
          brightness: Brightness.light,
        ),
      ),
      onGenerateTitle: (context) => context.strings.weather,
      home: const WeatherConditionPage(),
    );
  }
}
