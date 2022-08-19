import 'package:flutter/material.dart';

class Styles {
  MaterialColor materialColor() {
    return const MaterialColor(0xFFDA0909, {
      50: Color.fromRGBO(218, 9, 9, .1),
      100: Color.fromRGBO(218, 9, 9, .2),
      200: Color.fromRGBO(218, 9, 9, .3),
      300: Color.fromRGBO(218, 9, 9, .4),
      400: Color.fromRGBO(218, 9, 9, .5),
      500: Color.fromRGBO(218, 9, 9, .6),
      600: Color.fromRGBO(218, 9, 9, .7),
      700: Color.fromRGBO(218, 9, 9, .8),
      800: Color.fromRGBO(218, 9, 9, .9),
      900: Color.fromRGBO(218, 9, 9, 1),
    });
  }

  Color colorSecondary() {
    return Colors.red;
  }

  Color colorPrimary() {
    return const Color(0xFFDA0909);
  }

  BorderRadius borderInput() {
    return BorderRadius.circular(20.0);
  }

  Color colorTextDefault() {
    return Colors.white54;
  }

  Color colorTextDefault2() {
    return Colors.white70;
  }

  TextStyle titleInfoDetails() {
    return const TextStyle(
      color: Colors.black87,
      fontSize: 12.5,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle valueInfoDetails() {
    return const TextStyle(
      fontSize: 12.5,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle namePokemonDetails() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 25.5,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle idPokemonDetails() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 15.5,
      fontWeight: FontWeight.normal,
    );
  }

  Decoration cardBase() {
    return BoxDecoration(
      color: const Color(0xffffffff),
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }

  TextStyle namePokemonSimple() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
    );
  }
}

class PokemonInfoColorStyles {
  Color background = Colors.grey;
  Color backgroundAvatar = Colors.deepPurple;
  IconData icon = Icons.question_mark_rounded;
  String typeClass = '';

  void getType({required String type}) {
    switch (type.toLowerCase()) {
      case 'grass':
        background = Colors.green;
        backgroundAvatar = Colors.green.shade900;
        icon = Icons.grass;
        typeClass = 'Grama';
        break;
      case 'poison':
        background = Colors.lightGreen;
        backgroundAvatar = Colors.lightGreen.shade900;
        icon = Icons.coronavirus_outlined;
        typeClass = 'Veneno';
        break;
      case 'flying':
        background = Colors.blue;
        backgroundAvatar = Colors.blue.shade900;
        icon = Icons.air;
        typeClass = 'Voô';
        break;
      case 'water':
        background = Colors.blue;
        backgroundAvatar = Colors.blue.shade900;
        icon = Icons.water;
        typeClass = 'Água';
        break;
      case 'bug':
        background = Colors.brown;
        backgroundAvatar = Colors.brown.shade900;
        icon = Icons.bug_report;
        typeClass = 'Inseto';
        break;
      case 'normal':
        background = Colors.grey;
        backgroundAvatar = Colors.grey.shade600;
        icon = Icons.sentiment_neutral_sharp;
        typeClass = 'Normal';
        break;
      case 'electric':
        background = Colors.yellow.shade700;
        backgroundAvatar = Colors.yellow.shade900;
        icon = Icons.bolt;
        typeClass = 'Elétrico';
        break;
      case 'ground':
        background = Colors.brown;
        backgroundAvatar = Colors.brown.shade900;
        icon = Icons.cruelty_free_outlined;
        typeClass = 'Terra';
        break;
      case 'fighting':
        background = Colors.red;
        backgroundAvatar = Colors.red.shade900;
        icon = Icons.fitness_center_rounded;
        typeClass = 'Lutador';
        break;
      case 'fairy':
        background = Colors.purple;
        backgroundAvatar = Colors.purple.shade900;
        icon = Icons.flare;
        typeClass = 'Fada';
        break;
      case 'fire':
        background = Colors.red;
        backgroundAvatar = Colors.red.shade900;
        icon = Icons.local_fire_department;
        typeClass = 'Fogo';
        break;
      case 'dragon':
        background = Colors.red;
        backgroundAvatar = Colors.red.shade900;
        icon = Icons.pets;
        typeClass = 'Dragão';
        break;
      case 'psychic':
        background = Colors.teal;
        backgroundAvatar = Colors.teal.shade900;
        icon = Icons.leak_add;
        typeClass = 'Psíquico';
        break;
      case 'rock':
        background = Colors.brown;
        backgroundAvatar = Colors.brown.shade900;
        icon = Icons.landscape;
        typeClass = 'Pedra';
        break;
      case 'ghost':
        background = Colors.grey;
        backgroundAvatar = Colors.grey.shade600;
        icon = Icons.snapchat;
        typeClass = 'Fantasma';
        break;
      case 'steel':
        background = Colors.grey;
        backgroundAvatar = Colors.grey.shade600;
        icon = Icons.local_fire_department;
        typeClass = 'Aço';
        break;
      case 'shadow':
        background = Colors.grey;
        backgroundAvatar = Colors.grey.shade600;
        icon = Icons.visibility_off;
        typeClass = 'Sombra';
        break;
      case 'ice':
        background = Colors.blue;
        backgroundAvatar = Colors.blue.shade900;
        icon = Icons.ice_skating;
        typeClass = 'Gelo';
        break;
    }
  }
}
