import 'package:flutter/material.dart';
import 'package:pokedex/styles/style.dart';

class ChipsType {
  ChipsType();

  create({required String type}) {
    final styleColors = PokemonInfoColorStyles();
    styleColors.getType(type: type);

    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Chip(
        backgroundColor: styleColors.background,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        avatar: CircleAvatar(
          backgroundColor: styleColors.backgroundAvatar,
          child: Icon(styleColors.icon, color: Colors.white),
        ),
        label: Text(
          styleColors.typeClass,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
