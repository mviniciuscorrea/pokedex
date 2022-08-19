import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/helper.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/services/pokedex_service.dart';

class PokemonServiceMock extends Mock implements PokedexService {}

void main() {
  final serviceMock = PokemonServiceMock();
  final helper = Helper();
  const jsonResp =
      '{"abilities":[{"ability":{"name":"overgrow","url":"https://pokeapi.co/api/v2/ability/65/"}},{"ability":{"name":"chlorophyll","url":"https://pokeapi.co/api/v2/ability/34/"}}],"height":7,"id":1,"name":"bulbasaur","stats":[{"base_stat":45,"effort":0,"stat":{"name":"hp"}},{"base_stat":49,"effort":0,"stat":{"name":"attack"}},{"base_stat":49,"effort":0,"stat":{"name":"defense"}},{"base_stat":65,"effort":1,"stat":{"name":"special-attack"}},{"base_stat":65,"effort":0,"stat":{"name":"special-defense"}},{"base_stat":45,"effort":0,"stat":{"name":"speed"}}],"types":[{"slot":1,"type":{"name":"grass"}},{"slot":2,"type":{"name":"poison"}}],"weight":69}';

  test('Deve carregar as informações básicas do pokemon', () async {
    final response = Response(jsonResp, 200);

    when(() => serviceMock.pokemonDetails(idPokemon: 0))
        .thenAnswer((_) => Future.value(response));

    await serviceMock.pokemonDetails(idPokemon: 0).then((retorno) {
      final pokemon = PokemonDetails.fromJson(json.decode(response.body));

      expect(pokemon.id, isNonZero);
      expect(pokemon.id, isPositive);
      expect(pokemon.id, equals(1));

      expect(pokemon.weight, isNonZero);
      expect(pokemon.weight, isPositive);
      expect(pokemon.weight, equals(69));

      expect(pokemon.height, isNonZero);
      expect(pokemon.height, isPositive);
      expect(pokemon.height, equals(7));

      expect(pokemon.name, isNotNull);
      expect(pokemon.name, isNotEmpty);
      expect(pokemon.name, equals('Bulbasaur'));

      expect(pokemon.abilities, isNotNull);
      expect(pokemon.abilities.length, isNonZero);
      expect(pokemon.abilities.length, equals(2));

      expect(pokemon.abilities[0].ability.name, isNotNull);
      expect(pokemon.abilities[0].ability.name, isNotEmpty);
      expect(pokemon.abilities[0].ability.name, equals('Overgrow'));

      expect(pokemon.types, isNotNull);
      expect(pokemon.types.length, isNonZero);
      expect(pokemon.types.length, equals(2));

      expect(pokemon.types[0].type.name, isNotNull);
      expect(pokemon.types[0].type.name, isNotEmpty);
      expect(pokemon.types[0].type.name, equals('Grass'));

      expect(pokemon.types[1].type.name, isNotNull);
      expect(pokemon.types[1].type.name, isNotEmpty);
      expect(pokemon.types[1].type.name, equals('Poison'));

      expect(pokemon.stats, isNotNull);
      expect(pokemon.stats.length, isNonZero);
      expect(pokemon.stats.length, equals(6));

      expect(pokemon.stats[0].stat.name, isNotNull);
      expect(pokemon.stats[0].stat.name, isNotEmpty);
      expect(pokemon.stats[0].stat.name, equals('Hp'));

      expect(pokemon.stats[0].baseStat, isNotNull);
      expect(pokemon.stats[0].baseStat, isNonNegative);
      expect(pokemon.stats[0].baseStat, isNonZero);
      expect(pokemon.stats[0].baseStat, equals(45));

      expect(pokemon.stats[4].stat.name, isNotNull);
      expect(pokemon.stats[4].stat.name, isNotEmpty);
      expect(pokemon.stats[4].stat.name, equals('Special-defense'));

      expect(pokemon.stats[4].baseStat, isNotNull);
      expect(pokemon.stats[4].baseStat, isNonNegative);
      expect(pokemon.stats[4].baseStat, isNonZero);
      expect(pokemon.stats[4].baseStat, equals(65));
    });
  });

  test('Deve converter o peso para Kg', () {
    final weight = helper.hectogramsToKg(value: 69);

    expect(weight, isNotNull);
    expect(weight, isNotEmpty);
    expect(weight, equals("6.9"));
  });

  test('Deve converter a altura para cm', () {
    final height = helper.decimeterToCentimeter(value: 7);

    expect(height, isNotNull);
    expect(height, isNotEmpty);
    expect(height, equals('70'));
  });
}
