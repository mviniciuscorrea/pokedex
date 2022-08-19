import 'dart:convert';

PokemonBasicInformation pokemonListBasicFromJson(String str) =>
    PokemonBasicInformation.fromJson(json.decode(str));

String pokemonListBasicToJson(PokemonBasicInformation data) =>
    json.encode(data.toJson());

class PokemonBasicInformation {
  PokemonBasicInformation({
    required this.id,
    required this.name,
    required this.pokemon,
    required this.sprites,
    required this.types,
  });

  final int id;
  final String name;
  final Pokemon pokemon;
  final Sprites sprites;
  final List<Type> types;

  factory PokemonBasicInformation.fromJson(Map<String, dynamic> json) =>
      PokemonBasicInformation(
        id: json["id"],
        name:
            '${json["name"][0].toUpperCase()}${json["name"].substring(1).toLowerCase()}',
        pokemon: Pokemon.fromJson(json["pokemon"]),
        sprites: Sprites.fromJson(json["sprites"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pokemon": pokemon.toJson(),
        "sprites": sprites.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    required this.name,
  });

  final String name;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Pokemon type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Pokemon.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
