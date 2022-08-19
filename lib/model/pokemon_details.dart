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
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<AbilityElement> abilities;
  final int height;
  final int id;
  final String name;
  final List<StatElement> stats;
  final List<Type> types;
  final int weight;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
        abilities: List<AbilityElement>.from(
            json["abilities"].map((x) => AbilityElement.fromJson(x))),
        height: json["height"],
        id: json["id"],
        name:
            '${json["name"][0].toUpperCase()}${json["name"].substring(1).toLowerCase()}',
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "name": name,
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
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
