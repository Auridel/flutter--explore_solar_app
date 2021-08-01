import 'package:explore_solar_app/helpers/dataset.dart';
import 'package:explore_solar_app/models/planet.dart';
import 'package:flutter/material.dart';

class PlanetProvider with ChangeNotifier {
  List<Planet> _items = dataSet
      .map((e) => Planet(e['name'], e['num'], e['image'], e['description'], e['url'], e['images']))
      .toList();

  List<Planet> get items => _items;

  void addPlanet(Planet planet) {
    _items.add(planet);
    _items.sort((a, b) => b.num - a.num);
    notifyListeners();
  }
}
