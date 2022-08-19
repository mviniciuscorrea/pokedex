import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData? icon;

  const Button(
      {Key? key, required this.onPressed, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      label: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      icon: icon != null ? Icon(icon, color: Colors.white) : Container(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
        primary: Colors.red.shade400,
        minimumSize: Size(MediaQuery.of(context).size.height, 35.0),
      ),
    );
  }
}
