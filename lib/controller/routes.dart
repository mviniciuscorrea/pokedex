import 'package:flutter/material.dart';
import 'package:pokedex/view/details/details.dart';
import 'package:pokedex/view/home/home.dart';

class Routes {
  static const String routeHome = '/home';
  static const String routeDetails = '/details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeDetails:
        final args = settings.arguments;

        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Details(idPokemon: args['id']));
        } else {
          return MaterialPageRoute(builder: (_) => const Home());
        }

      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
