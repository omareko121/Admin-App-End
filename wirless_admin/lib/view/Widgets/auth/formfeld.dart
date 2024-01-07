// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class FormFeld extends StatelessWidget {
  final String lable;
  final IconData iconData;
  final TextEditingController? mycontlloer;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? Visiablity;
  final  void Function()? onTap;
  const FormFeld({
    super.key,
    required this.lable,
    required this.iconData,
    required this.mycontlloer,
    required this.valid, required this.isNumber, this.Visiablity, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber? TextInputType.numberWithOptions(decimal: true) : TextInputType.text ,
      validator: valid,
      obscureText: Visiablity == null  || Visiablity == false ? false : true,
      controller: mycontlloer,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          label: Text(
            lable,
            style: TextStyle(color: Colors.black, fontFamily: 'myfont1'),
          ),
          suffixIcon: InkWell(onTap: onTap ,child: Icon(iconData),),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
