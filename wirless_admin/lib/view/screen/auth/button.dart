import 'package:flutter/material.dart';

class Buttonoflogin extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Buttonoflogin({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      padding: const EdgeInsets.symmetric(vertical: 13),
      onPressed: onPressed,
      color: Colors.indigo[700],
      textColor: Colors.white,
      child: Text(text , style: const TextStyle(fontSize: 16 , fontFamily: 'myfont1' , fontWeight: FontWeight.bold , color: Colors.white),),
    );
  }
}
