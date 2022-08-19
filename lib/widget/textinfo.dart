import 'package:flutter/material.dart';
import 'package:pokedex/styles/style.dart';

class TextInfo extends StatelessWidget {
  final String title;
  final String value;

  const TextInfo({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Styles();

    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: RichText(
            text: TextSpan(
              style: style.titleInfoDetails(),
              children: [
                TextSpan(
                  text: title,
                ),
                TextSpan(
                  text: value,
                  style: style.valueInfoDetails(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
