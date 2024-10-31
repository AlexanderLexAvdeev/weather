import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/domain/domain.dart';
import 'package:weather/extensions/extensions.dart';

class PlaceSearchBar extends StatelessWidget {
  const PlaceSearchBar({super.key});

  Future<Iterable<Widget>> _buildSuggestions(
    BuildContext context,
    SearchController controller,
  ) async {
    final placesCubit = context.read<PlacesCubit>();
    await placesCubit.getSuggestions(controller.text);

    return switch (placesCubit.state) {
      ResultState<List<Place>> result => (result).data.map(
            (place) => ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(place.localName(context.currentLocale)),
                  Text(place.country),
                ],
              ),
              onTap: () => _onPlaceSelected(
                context,
                controller,
                place,
              ),
            ),
          ),
      _ => [],
    };
  }

  void _onPlaceSelected(
    BuildContext context,
    SearchController controller,
    Place place,
  ) async {
    controller.closeView(place.localName(context.currentLocale));
    context.read<WeatherConditionCubit>().getCurrentWeather(place);
    context.read<WeatherForecastDayCubit>().getForecast(place);
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: context.strings.searchPlace,
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          leading: const Icon(Icons.location_on_outlined),
          onChanged: (_) => controller.openView(),
          trailing: <Widget>[
            IconButton(
              onPressed: controller.clear,
              icon: const Icon(Icons.clear),
            ),
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return _buildSuggestions(context, controller);
      },
    );
  }
}
