import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Setting" , style: TextStyle(fontFamily: 'myfont1' , fontWeight: FontWeight.bold , color: Color.fromARGB(255, 255, 39, 39) , fontSize: 23),

        ),
      ),
      body: Container(),
    );
  }
}
