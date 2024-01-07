import 'package:flutter/material.dart';

class Cardhome extends StatelessWidget {
  final String title;
  final Function() onTap;
  final String img;
  const Cardhome(
      {super.key, required this.title, required this.onTap, required this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assest/img/${img}",
              height: 85,
            ),
            SizedBox(
              height: 8,
            ),
            Text(title,
                style: TextStyle(
                    fontFamily: 'myfont1',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 59, 0, 77),
                    fontSize: 19)),
          ],
        ),
      ),
    );
  }
}
