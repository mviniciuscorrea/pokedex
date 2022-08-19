import 'package:flutter/material.dart';
import 'package:pokedex/styles/style.dart';

class Input {
  Input();

  insertInputRequired(
      {required BuildContext context,
      required TextEditingController controller,
      required String label}) {
    final styles = Styles();

    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: styles.colorTextDefault2(),
        fontSize: 25,
      ),
      cursorWidth: 2.5,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: styles.colorTextDefault(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: styles.borderInput(),
          borderSide: BorderSide(
            width: 1.2,
            color: styles.colorTextDefault(),
          ),
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: styles.borderInput(),
          borderSide: BorderSide(
            width: 2.5,
            color: styles.colorTextDefault(),
          ),
        ),
        prefixIcon: Icon(
          Icons.catching_pokemon,
          color: styles.colorTextDefault(),
        ),
        suffix: GestureDetector(
          onTap: () => controller.clear(),
          child: Icon(
            Icons.clear,
            color: styles.colorTextDefault(),
          ),
        ),
      ),
    );
  }
}
