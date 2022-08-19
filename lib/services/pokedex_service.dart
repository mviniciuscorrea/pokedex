import 'package:http/http.dart' as http;
import 'package:pokedex/services/request_helper.dart';

class PokedexService {
  PokedexService();

  Future pokemonSimpleInfo({required String idNamePokemon}) async {
    if (idNamePokemon.isNotEmpty) {
      final request = RequestHelper();

      final response = await http
          .get(Uri.parse('${request.url}/pokemon-form/$idNamePokemon/'),
              headers: request.header)
          .timeout(
        Duration(seconds: request.timeOut),
        onTimeout: () {
          return http.Response(
            request.timeOutMessage,
            request.timeOutHttpCode,
          );
        },
      );

      return response;
    }
  }

  Future pokemonDetails({required int idPokemon}) async {
    if (idPokemon > 0) {
      final request = RequestHelper();

      final response = await http
          .get(Uri.parse('${request.url}/pokemon/$idPokemon/'),
              headers: request.header)
          .timeout(
        Duration(seconds: request.timeOut),
        onTimeout: () {
          return http.Response(
            request.timeOutMessage,
            request.timeOutHttpCode,
          );
        },
      );

      return response;
    }
  }
}
