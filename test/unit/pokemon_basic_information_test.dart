import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/model/pokemon_basic_information.dart';
import 'package:pokedex/services/pokedex_service.dart';

class PokemonServiceMock extends Mock implements PokedexService {}

void main() {
  final serviceMock = PokemonServiceMock();
  const jsonResp =
      '{"form_name":"","form_names":[],"form_order":1,"id":55,"is_battle_only":false,"is_default":true,"is_mega":false,"name":"golduck","names":[],"order":95,"pokemon":{"name":"golduck","url":"https://pokeapi.co/api/v2/pokemon/55/"},"sprites":{"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/55.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/55.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/55.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/55.png","front_shiny_female":null},"types":[{"slot":1,"type":{"name":"water","url":"https://pokeapi.co/api/v2/type/11/"}}],"version_group":{"name":"red-blue","url":"https://pokeapi.co/api/v2/version-group/1/"}}';

  test('Deve carregar as informações básicas do pokemon', () async {
    final response = Response(jsonResp, 200);

    when(() => serviceMock.pokemonSimpleInfo(idNamePokemon: ''))
        .thenAnswer((_) => Future.value(response));

    await serviceMock.pokemonSimpleInfo(idNamePokemon: '').then((retorno) {
      final pokemon =
          PokemonBasicInformation.fromJson(json.decode(response.body));

      expect(pokemon.id, isNonZero);
      expect(pokemon.id, isPositive);
      expect(pokemon.id, equals(55));

      expect(pokemon.name, isNotNull);
      expect(pokemon.name, isNotEmpty);
      expect(pokemon.name, equals('Golduck'));

      expect(pokemon.sprites.frontShiny, isNotNull);

      expect(pokemon.types, isNotNull);
      expect(pokemon.types.length, isNonZero);

      expect(pokemon.types[0].type.name, isNotNull);
      expect(pokemon.types[0].type.name, isNotEmpty);
      expect(pokemon.types[0].type.name, equals('water'));
    });
  });
}
