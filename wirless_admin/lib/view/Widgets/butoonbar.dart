// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Butoombar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String tetxapp;
  final bool active;
  const Butoombar(
      {super.key,
      required this.onPressed,
      required this.iconData,
      required this.tetxapp,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 29,
            color: active == true
                ? Color.fromARGB(255, 255, 39, 39)
                : Color.fromARGB(255, 0, 0, 0),
          ),
          Text(
            tetxapp,
            style: TextStyle(
                color: active == true
                    ? Color.fromARGB(255, 255, 39, 39)
                    : Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 13,
                fontFamily: 'Myfont1'),
          )
        ],
      ),
    );
  }
}
