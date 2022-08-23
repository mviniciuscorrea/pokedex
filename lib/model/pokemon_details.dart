import 'dart:convert';

PokemonDetails pokemonDetailsFromJson(String str) =>
    PokemonDetails.fromJson(json.decode(str));

String pokemonDetailsToJson(PokemonDetails data) => json.encode(data.toJson());

class PokemonDetails {
  PokemonDetails({
    required this.abilities,
    required this.height,
    required this.id,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
    required this.baseExperience,
  });

  final List<AbilityElement> abilities;
  final int height;
  final int id;
  final String name;
  final Sprites sprites;
  final List<StatElement> stats;
  final List<Type> types;
  final int weight;
  final int baseExperience;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
        abilities: List<AbilityElement>.from(
            json["abilities"].map((x) => AbilityElement.fromJson(x))),
        height: json["height"],
        id: json["id"],
        name:
            '${json["name"][0].toUpperCase()}${json["name"].substring(1).toLowerCase()}',
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
        baseExperience: json["base_experience"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "name": name,
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
        "base_experience": baseExperience
      };
}

class AbilityElement {
  AbilityElement({
    required this.ability,
  });

  final AbilityAbility ability;

  factory AbilityElement.fromJson(Map<String, dynamic> json) => AbilityElement(
        ability: AbilityAbility.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
      };
}

class AbilityAbility {
  AbilityAbility({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory AbilityAbility.fromJson(Map<String, dynamic> json) => AbilityAbility(
        name:
            '${json["name"][0].toUpperCase()}${json["name"].substring(1).toLowerCase()}',
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class StatElement {
  StatElement({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final TypeClass stat;

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: TypeClass.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class TypeClass {
  TypeClass({
    required this.name,
  });

  final String name;

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        name:
            '${json["name"][0].toUpperCase()}${json["name"].substring(1).toLowerCase()}',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final TypeClass type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: TypeClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class Sprites {
  Sprites({
    required this.other,
  });

  final Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "other": other.toJson(),
      };
}

class Other {
  Other({
    required this.dreamWorld,
  });

  final DreamWorld dreamWorld;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
  });

  final String frontDefault;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}
